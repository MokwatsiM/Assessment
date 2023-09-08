import 'dart:async';

import 'package:flutter/services.dart';

class ConnectionPlugin {
  static const MethodChannel _channel = MethodChannel('internet_connectivity');

  static Stream<bool> get onConnectivityChanged {
    return _onConnectivityChangedStreamController.stream;
  }

  static final StreamController<bool> _onConnectivityChangedStreamController =
      StreamController<bool>.broadcast();

  static Future<bool> checkConnectivity() async {
    try {
      final bool isConnected = await _channel.invokeMethod('checkConnectivity');
      return isConnected;
    } catch (e) {
      print('Error checking connectivity: $e');
      return false;
    }
  }
}
