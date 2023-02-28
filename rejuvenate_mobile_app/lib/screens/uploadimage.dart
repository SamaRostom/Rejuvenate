import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/custom_text.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? myfile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomText(
              shadows: [
                Shadow(
                  blurRadius: 30,
                  color: Colors.cyan,
                ),
              ],
              text: ' Choose How To Enter The Image ',
              fontSize: 40,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 14, color: Colors.white))),
              onPressed: () async {
                XFile? xFile =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                myfile = File(xFile!.path);
                setState(() {});
              },
              child: Column(
                children: const [
                  Icon(Icons.image_outlined),
                  Text(
                    'Pick Gallery',
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () async {
                XFile? xFile =
                    await ImagePicker().pickImage(source: ImageSource.camera);
                myfile = File(xFile!.path);
              },
              child: Column(
                children: const [
                  Icon(Icons.camera_alt_outlined),
                  Text(
                    'Pick Camera',
                    style: TextStyle(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
