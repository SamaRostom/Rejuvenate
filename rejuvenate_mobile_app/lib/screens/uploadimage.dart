import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.cyan,
                  ),
                ],
                text: 'Choose which way to enter the image ',
                fontSize: 30,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () async {
                  XFile? xFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
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
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(10)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () async {
                   Navigator.pushNamed(context, '/uploadimage');
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
      ),
    );
  }
}
