import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  String _selectFilePath = 'unknown';
  String _selectDirectoryPath = 'unknown';

  @override
  Widget build(BuildContext context) {
    // https://pub.dev/packages/file_picker
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () async {
              // FilePickerResult? result = await FilePicker.platform.pickFiles();
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'png']
              );
              if (null != result) {
                setState(() {
                  // _selectFilePath = result.files.single.path??'';

                  // List<File> selectFileList = result.paths.map((e) => File(e??'')).toList();
                  // _selectFilePath = selectFileList[0].path;

                  PlatformFile selectFile = result.files.first;
                  // _selectFilePath = '${selectFile.name} | ${selectFile.extension} | ${selectFile.bytes} | ${selectFile.size}';
                  _selectFilePath = selectFile.path??'';
                });
                print('select file path: $_selectFilePath');
              } else {
                print('select file exception');
              }
            }, child: const Text('select file')),
            Text('$_selectFilePath'),
            ElevatedButton(onPressed: () async {
              String? result = await FilePicker.platform.getDirectoryPath();
              if(null != result) {
                setState(() {
                  _selectDirectoryPath = result;
                });
                print('select directory path: $_selectDirectoryPath');
              } else {
                print('select directory exception');
              }
            }, child: const Text('select directory')),
            Text('$_selectDirectoryPath')
          ]
        ),
      )
    );
  }
}
