// ignore_for_file: use_build_context_synchronously

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rejuvenate_mobile_app/screens/input_image/preview_page.dart';

import '../../widgets/custom_text.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? myfile;
  late final XFile picture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 50.0),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Upload Image",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 30, color: Colors.cyan),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.cyan),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(40, 10, 40, 10)),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 14, color: Colors.white))),
                    onPressed: () async {
                      XFile? xFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      myfile = File(xFile!.path);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PreviewPage(
                                    myfile: xFile,
                                  )));
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
                  const SizedBox(width: 10.0),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.cyan),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(40, 10, 40, 10)),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 14, color: Colors.white))),
                    onPressed: () async {
                      XFile? xFile = await ImagePicker()
                          .pickImage(source: ImageSource.camera);
                      myfile = File(xFile!.path);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PreviewPage(
                                    myfile: xFile,
                                  )));
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
            ],
          ),
        ),
      ),
    );
  }
}
