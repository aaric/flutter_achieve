import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ftpconnect/ftpconnect.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final _ftpHost = '127.0.0.1';
  final _ftpUser = 'test';
  final _ftpPass = 'test';
  final _remoteDir = "test";

  @override
  Widget build(BuildContext context) {
    // https://pub.dev/packages/ftpconnect
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async {
              // select file
              var imageFilePath = await selectImage();

              // upload file
              if (null != imageFilePath) {
                File uploadFile = File(imageFilePath);

                // uploadFileWithRetry(uploadFile);
                uploadFileThrowException(uploadFile, _remoteDir);
              }
            }, child: const Text('upload file')),
            ElevatedButton(onPressed: () async {
              uploadZipFile('test.zip', _remoteDir);
            }, child: const Text('upload zip file')),
            ElevatedButton(onPressed: () async {
              downloadFileUnzip('test.zip', _remoteDir);
            }, child: const Text('download zip file'))
          ]
        )
      )
    );
  }

  Future<String> selectImage() async {
    var selectFilePath = '';
    var result = await FilePicker.platform.pickFiles(
        type: FileType.image
    );
    if (null != result) {
      selectFilePath = result.files.first.path??'';
      print('select file: $selectFilePath');
    }
    return selectFilePath;
  }

  void uploadFileWithRetry(File uploadFile) async {
    var client = FTPConnect(_ftpHost, user: _ftpUser, pass: _ftpPass);
    var connected = await client.connect();
    if (connected) {
      var uploaded = await client.uploadFileWithRetry(uploadFile, pRetryCount: 3);
      if (uploaded) {
        print('upload file: ${uploadFile.path}');
      } else {
        print('upload file exception');
      }
      var disconnected = await client.disconnect();
      if (disconnected) {
        print('client disconnected');
      } else {
        print('client disconnected exception');
      }
    } else {
      print('client connected exception');
    }
  }

  void uploadFileThrowException(File uploadFile, String remoteDir) async {
    try {
      var client = FTPConnect(_ftpHost, user: _ftpUser, pass: _ftpPass);
      await client.connect();
      if (!(await client.checkFolderExistence(remoteDir))) {
        await client.makeDirectory(remoteDir);
        print('create dir: $remoteDir');
      }
      await client.changeDirectory(remoteDir);
      await client.uploadFile(uploadFile);
      print('upload file: ${uploadFile.path}');
      await client.disconnect();
    } catch (e) {
      print('upload file exception');
    }
  }

  Future<Directory> getAppDir() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    print('appDir: $appDir');
    return appDir;
  }

  Future<File> newTxtFile({String fileName = 'test.txt', String content = ''}) async {
    final Directory parent = (await getAppDir())..createSync(recursive: true);
    final File file = File('${parent.path}/$fileName');
    await file.writeAsString(content);
    return file;
  }

  void uploadZipFile(String zipFileName, String remoteDir) async {
    try {
      // if(await Permission.storage.request().isGranted) {
      File javaFile = await newTxtFile(
          fileName: "java.txt", content: 'hello java');
      File flutterFile = await newTxtFile(
          fileName: "flutter.txt", content: 'hello flutter');
      var zipFilePath = '${(await getAppDir()).path}/$zipFileName';
      await FTPConnect.zipFiles([javaFile.path, flutterFile.path], zipFilePath);
      // }

      var client = FTPConnect(_ftpHost, user: _ftpUser, pass: _ftpPass);
      await client.connect();
      if (!(await client.checkFolderExistence(remoteDir))) {
        await client.makeDirectory(remoteDir);
        print('create dir: $remoteDir');
      }
      await client.changeDirectory(remoteDir);
      await client.uploadFile(File(zipFilePath));
      await client.disconnect();
    } catch (e) {
      print(e);
    }
  }

  void downloadFileUnzip(String zipFileName, String remoteDir) async {
    try {
      var client = FTPConnect(_ftpHost, user: _ftpUser, pass: _ftpPass);
      await client.connect();
      if (!(await client.checkFolderExistence(remoteDir))) {
        await client.makeDirectory(remoteDir);
        print('create dir: $remoteDir');
      }
      await client.changeDirectory(remoteDir);

      // String? parent = await FilePicker.platform.getDirectoryPath();
      // if (null != parent) {
      var parent = (await getAppDir()).path;
      var zipFile = File('$parent/$zipFileName');
      await client.downloadFile(zipFileName, zipFile);
      FTPConnect.unZipFile(zipFile, parent);
      // }

      await client.disconnect();
    } catch (e) {
      print(e);
    }
  }
}
