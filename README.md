# flutter_achieve

[![Flutter](https://img.shields.io/badge/Flutter-3.3.0-brightgreen.svg?style=flat&logo=flutter)](https://docs.flutter.dev)
[![Android SDK](https://img.shields.io/badge/Android_SDK-33-brightgreen.svg?style=flat&logo=android)](https://developer.android.com/docs)
[![Android Studio](https://img.shields.io/badge/Android_Studio-2021.2.1-brightgreen.svg?style=flat&logo=android_studio)](https://developer.android.com/studio)
[![Visual Studio](https://img.shields.io/badge/Visual_Studio-17.2-brightgreen.svg?style=flat&logo=visual_studio)](https://visualstudio.microsoft.com/)
[![Release](https://img.shields.io/badge/Release-2.3.0-blue.svg)](https://github.com/aaric/flutter_achieve/releases)

> A new Flutter project.

## 1 Flutter 社区镜像

&emsp;&emsp;[Dart packages: https://pub.dev](https://pub.flutter-io.cn)

> 社区主镜像，采用多种方式同步 Flutter 开发者资源（推荐）。有任何镜像相关的问题，请与我们[反馈镜像问题](https://github.com/cfug/flutter.cn/issues)，中国镜像存储由[七牛云](https://sensors.qiniu.com/t/n9Q)提供服务。

```powershell
$env:PUB_HOSTED_URL = https://pub.flutter-io.cn
$env:FLUTTER_STORAGE_BASE_URL = https://storage.flutter-io.cn
```

## 2 Flutter Doctor 问题解决思路

### 2.1 [✗] Android toolchain - develop for Android devices

```powershell
# Unable to locate Android SDK.
$env:ANDROID_HOME = E:\cache_app\sdk

# Android license status unknown.
flutter doctor --android-licenses
```

### 2.2 [✗] Visual Studio - develop for Windows

> [Select the installation locations in Visual Studio](https://docs.microsoft.com/en-us/visualstudio/install/change-installation-locations?view=vs-2022)

```powershell
# https://docs.microsoft.com/en-us/visualstudio/install/create-an-offline-installation-of-visual-studio?view=vs-2022
.\vs_community.exe --layout E:\vs2022 --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended --lang zh-CN
.\vs_community.exe --noweb --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended --lang zh-CN
```

### 2.3 [✗] You need Java 11 or higher to build your app with this version of Gradle

**`<project_dir>\\android\\gradle.properties`**

```properties
org.gradle.java.home=D\:\\DevTools\\jdk-17.0.4
```

## 3 Flutter 环境设置与支持

### 3.1 OS环境变量

```powershell
$env:ANDROID_HOME = D:\DevTools\sdk
$env:PUB_HOSTED_URL = https://pub.flutter-io.cn
$env:FLUTTER_STORAGE_BASE_URL = https://storage.flutter-io.cn
$env:FLUTTER_HOME = D:\DevTools\flutter
$env:DART_HOME = %FLUTTER_HOME%\bin\cache\dart-sdk
$env:JAVA_HOME = D:\DevTools\jdk-17.0.2
$env:GRADLE_HOME = D:\DevTools\gradle-7.4

$env:Path += ;"%ANDROID_HOME%\platform-tools"
$env:Path += ;"%FLUTTER_HOME%\bin"
$env:Path += ;"%DART_HOME%\bin"
$env:Path += ;"%JAVA_HOME%\bin"
$env:Path += ;"%GRADLE_HOME%\bin"

ls $env:
```

### 3.2 Flutter 终端支持

```powershell
# windows
flutter config --enable-windows-desktop
start ms-settings:developers
flutter build windows --release

# macos
flutter config --enable-macos-desktop

# linux
flutter config --enable-linux-desktop
```

## 4 Flutter 插件与支持

|No.|Plugin Name|Current Version|Demo|Remark|
|:---:|:---:|:---:|:---:|-----|
|1|[css_colors](https://pub.dev/packages/css_colors)|`^1.1.1`|[ex01_css_colors.dart](https://github.com/aaric/flutter_achieve/blob/master/lib/ex01_css_colors.dart)|*CSS颜色*|
|2|[fluttertoast](https://pub.dev/packages/fluttertoast)|`^8.0.9`|[ex02_fluttertoast.dart](https://github.com/aaric/flutter_achieve/blob/master/lib/ex02_fluttertoast.dart)|*类似Android Toast提示*|
|3|[url_launcher](https://pub.dev/packages/url_launcher)|`^6.1.5`|[ex03_url_launcher.dart](https://github.com/aaric/flutter_achieve/blob/master/lib/ex03_url_launcher.dart)|*打开URL链接*|
|4|[mqtt_client](https://pub.dev/packages/mqtt_client)|`^9.7.2`|[ex04_mqtt_client.dart](https://github.com/aaric/flutter_achieve/blob/master/lib/ex04_mqtt_client.dart)|*MQTT支持*|
|5|[device_info_plus](https://pub.dev/packages/device_info_plus)|`^4.1.2`|[ex05_device_info_plus.dart](https://github.com/aaric/flutter_achieve/blob/master/lib/ex05_device_info_plus.dart)|*获取设置信息*|
|6|[wakelock](https://pub.dev/packages/wakelock)|`^0.6.2`|[ex06_wakelock.dart](https://github.com/aaric/flutter_achieve/blob/master/lib/ex06_wakelock.dart)|*防止屏幕休眠*|
|7|[shared_preferences](https://pub.dev/packages/shared_preferences)|`^2.0.15`|[ex07_shared_preferences.dart](https://github.com/aaric/flutter_achieve/blob/master/lib/ex07_shared_preferences.dart)|*简单持久存储数据*|
|8|[file_picker](https://pub.dev/packages/file_picker)|`^5.0.1`|[ex08_file_picker.dart](https://github.com/aaric/flutter_achieve/blob/master/lib/ex08_file_picker.dart)|*文件选择*|
|9|[ftpconnect](https://pub.dev/packages/ftpconnect)|`^1.0.1`|[ex09_ftpconnect.dart](https://github.com/aaric/flutter_achieve/blob/master/lib/ex09_ftpconnect.dart)|*FTP客户端*|

## 5 应用名称与LOGO

### 5.1 应用名称

|No.|Terminal|File Path|Keyword|Remark|
|:---:|:---:|-----|:---:|-----|
|1|Android|[`AndroidManifest.xml`](android/app/src/main/AndroidManifest.xml)|`android:label="flutter_achieve"`|*Flutter小例子*|
|2|iOS|[`Info.plist`](ios/Runner/Info.plist)|`CFBundleName`|*No Testing*|
|3|Windows|[`main.cpp`](windows/runner/main.cpp)|`window.CreateAndShow(L"flutter_achieve", origin, size)`|*存在中文兼容问题*|
|4|MacOS|[`AppInfo.xcconfig`](macos/Runner/Configs/AppInfo.xcconfig)|`PRODUCT_NAME = flutter_achieve`|*No Testing*|
|5|Linux|[`my_application.cc`](linux/my_application.cc)|`gtk_header_bar_set_title` `gtk_window_set_title`|*No Testing*|

### 5.2 LOGO

|No.|Terminal|File Path|Remark|
|:---:|:---:|-----|-----|
|1|Android|[`mipmap-*/ic_launcher.png`](android/app/src/main/res)|*Image Asset Studio*|
|2|iOS|[`Icon-App-*@*.png`](ios/Runner/Assets.xcassets/AppIcon.appiconset)||
|3|Windows|[`app_icon.ico`](windows/runner/resources)|[tool.lu](https://tool.lu/favicon/)|
|4|MacOS|[`app_icon_*.png`](macos/Runner/Assets.xcassets/AppIcon.appiconset)||
|5|Linux||*Pending*|
