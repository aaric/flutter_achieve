import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:ftpconnect/ftpconnect.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  var _ftpHost = '10.0.11.25';
  var _ftpUser = 'incar_pkg';
  var _ftpPass = 'incar_pkg';

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
              // select image
              var imageFilePath =

              // upload file
              if (null != imageFilePath) {
                File uploadFile = File(imageFilePath);

                // uploadFileWithRetry(uploadFile);

                var saveDir = "test";
                uploadFileThrowException(uploadFile, saveDir);

              }
            }, child: const Text('upload file'))
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

  void uploadFileThrowException(File uploadFile, String saveDir) async {
    try {
      var client = FTPConnect(_ftpHost, user: _ftpUser, pass: _ftpPass);
      await client.connect();
      if (!(await client.checkFolderExistence(saveDir))) {
        await client.makeDirectory(saveDir);
        print('create dir: $saveDir');
      }
      await client.changeDirectory(saveDir);
      await client.uploadFile(uploadFile);
      print('upload file: ${uploadFile.path}');
      await client.disconnect();
    } catch (e) {
      print('upload file exception');
    }
  }
}
