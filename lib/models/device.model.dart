class DeviceModel {
  String appName;
  String buildNumber;
  String packageName;
  String appVersion;
  bool isPhysicalDevice;
  String osRelease;
  String os;
  String deviceModel;

  DeviceModel({
    this.appName,
    this.buildNumber,
    this.packageName,
    this.appVersion,
    this.isPhysicalDevice,
    this.osRelease,
    this.os,
    this.deviceModel
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['appName'] = appName;
    data['buildNumber'] = buildNumber;
    data['packageName'] = packageName;
    data['appVersion'] = appVersion;
    data['isPhysicalDevice'] = isPhysicalDevice;
    data['osRelease'] = osRelease;
    data['os'] = os;
    data['deviceModel'] = deviceModel;
    return data;
  }
}