import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flug/models/device.model.dart';
import 'package:package_info/package_info.dart';

class FlugDevice {
  static getDevice() async {
    var package = await PackageInfo.fromPlatform();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    DeviceModel device = DeviceModel(
      appName: package.appName,
      appVersion: package.version,
      buildNumber: package.buildNumber,
      packageName: package.packageName,
    );
    if(Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo; 
      device.deviceModel = androidInfo.model;
      device.isPhysicalDevice = androidInfo.isPhysicalDevice;
      device.os = 'Android';
      device.osRelease = androidInfo.version.release;
    } else if(Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      device.deviceModel = iosInfo.model;
      device.isPhysicalDevice = iosInfo.isPhysicalDevice;
      device.os = 'iOS';
      device.osRelease = iosInfo.systemVersion;
    }

    return device;
  }
}