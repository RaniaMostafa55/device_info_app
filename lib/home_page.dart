import 'dart:io';
import 'package:device_info_app/info_display_widget.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  AndroidDeviceInfo? androidInfo;
  IosDeviceInfo? iosInfo;
  @override
  void initState() {
    super.initState();
    getDeviceInfo();
  }

  getDeviceInfo() async {
    //check device platform to get the correct info
    if (Platform.isAndroid) {
      androidInfo = await deviceInfo.androidInfo;
    } else if (Platform.isIOS) {
      iosInfo = await deviceInfo.iosInfo;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: Text("Device Info"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //view android info
          if (androidInfo != null && Platform.isAndroid) ...{
            InfoDisplayWidget(title: "Device Model:", data: androidInfo!.model),
            SizedBox(height: 20),
            InfoDisplayWidget(
                title: "Device Operating system version:",
                data: androidInfo!.version.release)
            //view ios info
          } else if (iosInfo != null && Platform.isIOS) ...{
            InfoDisplayWidget(title: "Device Model:", data: iosInfo!.model),
            SizedBox(height: 20),
            InfoDisplayWidget(
                title: "Device Operating system version:",
                data: iosInfo!.systemVersion)
          } else ...{
            CircularProgressIndicator()
          }
        ],
      ),
    );
  }
}
