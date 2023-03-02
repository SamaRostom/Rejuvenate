
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';



class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.myfile}) : super(key: key);

  final XFile myfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview Page')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Image.file(File(myfile.path), fit: BoxFit.cover, width: 250),
          const SizedBox(height: 24),
          Text(myfile.name)
        ]),
      ),
    );
  }
}