#import "ConnectionPlugin.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>

@implementation ConnectionPlugin {
    FlutterEventSink _eventSink;
    CTTelephonyNetworkInfo *_telephonyNetworkInfo;
}

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
        methodChannelWithName:@"internet_connectivity"
              binaryMessenger:[registrar messenger]];
    ConnectionPlugin* instance = [[ConnectionPlugin alloc] init];
    [registrar addMethodCallDelegate:instance channel:channel];

    FlutterEventChannel* eventChannel = [FlutterEventChannel
        eventChannelWithName:@"internet_connectivity/events"
              binaryMessenger:[registrar messenger]];
    [eventChannel setStreamHandler:instance];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _telephonyNetworkInfo = [[CTTelephonyNetworkInfo alloc] init];
    }
    return self;
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([call.method isEqualToString:@"checkConnectivity"]) {
        BOOL isConnected = [self isConnected];
        result(@(isConnected));
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (void)onListenWithArguments:(id)arguments eventSink:(FlutterEventSink)events {
    _eventSink = events;
    [self startMonitoring];
}

- (void)onCancelWithArguments:(id)arguments {
    _eventSink = nil;
    [self stopMonitoring];
}

- (BOOL)isConnected {
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;

    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithAddress(
        kCFAllocatorDefault,
        (const struct sockaddr*)&zeroAddress
    );

    SCNetworkReachabilityFlags flags;
    BOOL status = SCNetworkReachabilityGetFlags(reachability, &flags);
    CFRelease(reachability);

    if (!status) {
        return NO;
    }

    BOOL isReachable = (flags & kSCNetworkReachabilityFlagsReachable) != 0;
    BOOL needsConnection = (flags & kSCNetworkReachabilityFlagsConnectionRequired) != 0;

    return isReachable && !needsConnection;
}

- (void)startMonitoring {
    [_telephonyNetworkInfo addObserver:self
                            forKeyPath:@"dataServiceIdentifier"
                               options:NSKeyValueObservingOptionNew
                               context:nil];
}

- (void)stopMonitoring {
    [_telephonyNetworkInfo removeObserver:self forKeyPath:@"dataServiceIdentifier"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    if ([keyPath isEqualToString:@"dataServiceIdentifier"]) {
        BOOL isConnected = [self isConnected];
        if (_eventSink) {
            _eventSink(@(isConnected));
        }
    }
}

@end
