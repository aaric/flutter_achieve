# flutter_applet

[![JDK](https://img.shields.io/badge/JDK-17.0.2-brightgreen.svg?style=flat&logo=java)](https://www.oracle.com/java/technologies/javase-downloads.html)
[![Flutter](https://img.shields.io/badge/Flutter-3.0.2-brightgreen.svg?style=flat&logo=flutter)](https://docs.flutter.dev)
[![Android](https://img.shields.io/badge/Android-32-brightgreen.svg?style=flat&logo=android)](https://developer.android.com/docs)
[![Android Studio](https://img.shields.io/badge/Android_Studio-2021.2.1-brightgreen.svg?style=flat&logo=android_studio)](https://developer.android.com/studio)
[![Visual Studio](https://img.shields.io/badge/Visual_Studio-17.2-brightgreen.svg?style=flat&logo=visual_studio)](https://visualstudio.microsoft.com/)
[![release](https://img.shields.io/badge/release-2.0.0-blue.svg)](https://github.com/aaric/flutter_achieve/releases)

> A new Flutter project.

## 1 社区运行的镜像站点

[https://pub.dev](https://pub.flutter-io.cn)

### 1.1 Flutter 社区

> 社区主镜像，采用多种方式同步 Flutter 开发者资源（推荐）。有任何镜像相关的问题，请与我们[反馈镜像问题](https://github.com/cfug/flutter.cn/issues)，中国镜像存储由[七牛云](https://sensors.qiniu.com/t/n9Q)提供服务。

```powershell
$env:PUB_HOSTED_URL="https://pub.flutter-io.cn"
$env:FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
```

### 1.2 CNNIC

> 基于 TUNA 协会的镜像服务，数据策略和内容与 TUNA 一致，通过非教育网的域名访问（建议选择 TUNA）。暂无反馈渠道，可尝试 TUNA 反馈渠道。

```powershell
$env:PUB_HOSTED_URL="http://mirrors.cnnic.cn/dart-pub"
$env:FLUTTER_STORAGE_BASE_URL="http://mirrors.cnnic.cn/flutter"
```

## 2 Flutter Doctor

### 2.1 \[✗\] Android toolchain - develop for Android devices

```powershell
# Unable to locate Android SDK.
$env:ANDROID_HOME="E:\cache_app\sdk"

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

**<project\_dir>\\android\\gradle.properties**

```properties
org.gradle.java.home=D\:\\DevTools\\jdk-17.0.2
```

## 3 开启支持

### 3.1 Windows桌面

```powershell
flutter config --enable-windows-desktop
start ms-settings:developers
```

### 3.2 MacOS桌面

```bash
flutter config --enable-macos-desktop
```

### 3.3 Linux桌面

```bash
flutter config --enable-linux-desktop
```
