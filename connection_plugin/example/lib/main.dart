import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:connection_plugin/connection_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isConnected = false;

  @override
  void initState() {
    super.initState();
    ConnectionPlugin.onConnectivityChanged.listen((bool isConnected) async {
      setState(() {
        _isConnected = isConnected;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Internet Connectivity Plugin'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Internet Connectivity:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                _isConnected ? 'Connected' : 'Disconnected',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: _isConnected ? Colors.green : Colors.red,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  bool isConnected = await ConnectionPlugin.checkConnectivity();
                  setState(() {
                    _isConnected = isConnected;
                  });
                },
                child: const Text('Check Connectivity'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
