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
              var imageFilePath;
              var result = await FilePicker.platform.pickFiles(
                type: FileType.image
              );
              if (null != result) {
                imageFilePath = result.files.first.path;
                print('select image: $imageFilePath');
              }
              
              // upload file
              if (null != imageFilePath) {
                File uploadFile = File(imageFilePath);

                // var client = FTPConnect(_ftpHost, user: _ftpUser, pass: _ftpPass);
                // var connected = await client.connect();
                // if (connected) {
                //   var uploaded = await client.uploadFileWithRetry(uploadFile, pRetryCount: 3);
                //   if (uploaded) {
                //     print('upload file ok');
                //   } else {
                //     print('upload file exception');
                //   }
                //   var disconnected = await client.disconnect();
                //   if (disconnected) {
                //     print('disconnected');
                //   } else {
                //     print('disconnected exception');
                //   }
                // } else {
                //   print('connected exception');
                // }

                try {
                  var client = FTPConnect(_ftpHost, user: _ftpUser, pass: _ftpPass);
                  await client.connect();
                  await client.uploadFile(uploadFile);
                  await client.disconnect();
                } catch (e) {
                  print('upload file exception');
                }
              }
            }, child: const Text('upload file'))
          ]
        )
      )
    );
  }
}
