package com.example.connection_plugin



import android.content.Context
import android.net.ConnectivityManager
import android.os.Build
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.Registrar

class ConnectionPlugin : FlutterPlugin {
    private lateinit var applicationContext: Context
    private lateinit var channel: MethodChannel
    private lateinit var eventChannel: EventChannel

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private val connectivityCallback = object : ConnectivityManager.NetworkCallback() {
        override fun onAvailable(network: android.net.Network) {
            _onConnectivityChangedStream.success(true)
        }

        override fun onLost(network: android.net.Network) {
            _onConnectivityChangedStream.success(false)
        }
    }

    private lateinit var _onConnectivityChangedStream: EventChannel.EventSink

    override fun onAttachedToEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        applicationContext = binding.applicationContext
        channel = MethodChannel(binding.binaryMessenger, "internet_connectivity")
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "checkConnectivity" -> {
                    val isConnected = isConnected()
                    result.success(isConnected)
                }
                else -> result.notImplemented()
            }
        }

        eventChannel = EventChannel(binding.binaryMessenger, "internet_connectivity/events")
        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                _onConnectivityChangedStream = events ?: return
                registerNetworkCallback()
            }

            override fun onCancel(arguments: Any?) {
                _onConnectivityChangedStream.endOfStream()
            }
        })
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        eventChannel.setStreamHandler(null)
    }

    @RequiresApi(Build.VERSION_CODES.LOLLIPOP)
    private fun registerNetworkCallback() {
        val connectivityManager =
            applicationContext.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val networkRequest = android.net.NetworkRequest.Builder()
            .addCapability(android.net.NetworkCapabilities.NET_CAPABILITY_INTERNET)
            .build()
        connectivityManager.registerNetworkCallback(networkRequest, connectivityCallback)
    }

    @RequiresApi(Build.VERSION_CODES.M)
    private fun isConnected(): Boolean {
        val connectivityManager =
            applicationContext.getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        val network = connectivityManager.activeNetwork
        val capabilities = connectivityManager.getNetworkCapabilities(network)
        return capabilities?.hasCapability(android.net.NetworkCapabilities.NET_CAPABILITY_INTERNET) == true
    }
}
