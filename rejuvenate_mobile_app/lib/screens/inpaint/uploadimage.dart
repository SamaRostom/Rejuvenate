
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'preview_page.dart';

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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: const Color.fromARGB(255, 1, 6, 29),
        shadowColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 50),
          child: Column(
            children: [
              Image.asset(
                'assets/upload.jpg',
                height: 250,
                width: 300,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 20),
                child: Text(
                  "Upload the image you want \t \t \t \t \tto see the results for",
                  style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: const Color.fromARGB(255, 1, 6, 29)),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[900]),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(50, 20, 70, 20)),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 20, color: Colors.white))),
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
                        Icon(
                          Icons.image_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Pick Gallery',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[900]),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(50, 20, 70, 20)),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 20, color: Colors.white))),
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
                        Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                        Text(
                          'Pick Camera',
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
