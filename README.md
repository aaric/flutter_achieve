# flutter_achieve

[![JDK](https://img.shields.io/badge/JDK-17.0.2-brightgreen.svg?style=flat&logo=java)](https://www.oracle.com/java/technologies/javase-downloads.html)
[![Flutter](https://img.shields.io/badge/Flutter-3.0.2-brightgreen.svg?style=flat&logo=flutter)](https://docs.flutter.dev)
[![Android](https://img.shields.io/badge/Android-32-brightgreen.svg?style=flat&logo=android)](https://developer.android.com/docs)
[![Android Studio](https://img.shields.io/badge/Android_Studio-2021.2.1-brightgreen.svg?style=flat&logo=android_studio)](https://developer.android.com/studio)
[![Visual Studio](https://img.shields.io/badge/Visual_Studio-17.2-brightgreen.svg?style=flat&logo=visual_studio)](https://visualstudio.microsoft.com/)
[![release](https://img.shields.io/badge/release-2.0.0-blue.svg)](https://github.com/aaric/flutter_achieve/releases)

> A new Flutter project.

## 1 Flutter 社区镜像

[https://pub.dev](https://pub.flutter-io.cn)

### 1.1 Flutter 社区

> 社区主镜像，采用多种方式同步 Flutter 开发者资源（推荐）。有任何镜像相关的问题，请与我们[反馈镜像问题](https://github.com/cfug/flutter.cn/issues)，中国镜像存储由[七牛云](https://sensors.qiniu.com/t/n9Q)提供服务。

```powershell
$env:PUB_HOSTED_URL = https://pub.flutter-io.cn
$env:FLUTTER_STORAGE_BASE_URL = https://storage.flutter-io.cn
```

### 1.2 CNNIC

> 基于 TUNA 协会的镜像服务，数据策略和内容与 TUNA 一致，通过非教育网的域名访问（建议选择 TUNA）。暂无反馈渠道，可尝试 TUNA 反馈渠道。

```powershell
$env:PUB_HOSTED_URL = http://mirrors.cnnic.cn/dart-pub
$env:FLUTTER_STORAGE_BASE_URL = http://mirrors.cnnic.cn/flutter
```

## 2 Flutter Doctor 问题解决思路

### 2.1 \[✗\] Android toolchain - develop for Android devices

```powershell
# Unable to locate Android SDK.
$env:ANDROID_HOME = E:\cache_app\sdk

# Android license status unknown.
flutter doctor --android-licenses
```

### 2.2 \[✗\] Visual Studio - develop for Windows

> [Select the installation locations in Visual Studio](https://docs.microsoft.com/en-us/visualstudio/install/change-installation-locations?view=vs-2022)

```powershell
# https://docs.microsoft.com/en-us/visualstudio/install/create-an-offline-installation-of-visual-studio?view=vs-2022
.\vs_community.exe --layout E:\vs2022 --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended --lang zh-CN
.\vs_community.exe --noweb --add Microsoft.VisualStudio.Workload.NativeDesktop --includeRecommended --lang zh-CN
```

### 2.3 \[✗\] You need Java 11 or higher to build your app with this version of Gradle.

**`<project_dir>\\android\\gradle.properties`**

```properties
org.gradle.java.home=D\:\\DevTools\\jdk-17.0.2
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

|No.|Plugin Name|Current Version|Permission|Remark|
|:---:|:---:|:---:|:---:|-----|
|1|[css_colors](https://pub.dev/packages/css_colors)|`^1.1.1`||*CSS颜色*|
|2|[fluttertoast](https://pub.dev/packages/fluttertoast)|`^8.0.9`||*类似Android Toast提示*|
|3|[url_launcher](https://pub.dev/packages/url_launcher)|`^6.1.4`||*打开URL链接*|
|4|[mqtt_client](https://pub.dev/packages/mqtt_client)|`^9.6.8`||*MQTT支持*|
|5|[device_info_plus](https://pub.dev/packages/device_info_plus)|`^4.0.0`||*获取设置信息*|
|6|[wakelock](https://pub.dev/packages/wakelock)|`^0.6.1+2`||*防止屏幕休眠*|
|7|[shared_preferences](https://pub.dev/packages/shared_preferences)|`^2.0.15`||*简单持久存储数据*|

## 5 应用名称与LOGO

### 5.1 应用名称

|No.|Terminal|File Path|Keyword|Remark|
|:---:|:---:|-----|:---:|-----|
|1|Android|[`AndroidManifest.xml`](android/app/src/main/AndroidManifest.xml)|`android:label="flutter_achieve"`|*Flutter小例子*|
|2|iOS|[`Info.plist`](ios/Runner/Info.plist)|`CFBundleName`||
|3|Windows|[`window_size`](https://github.com/google/flutter-desktop-embedding)|||
|4|MacOS|[`window_size`](https://github.com/google/flutter-desktop-embedding)|||
|5|Linux|[`window_size`](https://github.com/google/flutter-desktop-embedding)|||

### 5.2 LOGO

|No.|Terminal|File Path|Remark|
|:---:|:---:|-----|-----|
|1|Android|[`mipmap-*/ic_launcher.png`](android/app/src/main/res)|*Image Asset Studio*|
|2|iOS|[`Icon-App-*@*.png`](ios/Runner/Assets.xcassets/AppIcon.appiconset)||
|3|Windows|[`app_icon.ico`](windows/runner/resources)|[tool.lu](https://tool.lu/favicon/)|
|4|MacOS|[`app_icon_*.png`](macos/Runner/Assets.xcassets/AppIcon.appiconset)||
|5|Linux||*TBD*|
