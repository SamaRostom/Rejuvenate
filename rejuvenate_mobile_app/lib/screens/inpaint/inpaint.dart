import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rejuvenate_mobile_app/providers/inpaint_provider.dart';

class InpaintPage extends ConsumerStatefulWidget {
  const InpaintPage({Key? key}) : super(key: key);

  @override
  _InpaintPageState createState() => _InpaintPageState();
}

class _InpaintPageState extends ConsumerState<InpaintPage> {
  File? _image;
  File? _mask;
  Uint8List? _outputImage;
  Image? image2;
  String? imageStr;
  Uint8List? imageData;
  late final myProviderListenable;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  Future<void> _getMask(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      _mask = File(pickedFile!.path);
    });
  }

  Future<void> _inpaintImage() async {
    if (_image == null || _mask == null) {
      return;
    }

    final url = 'http://192.168.1.3:8000/inpaint';
    final request = http.MultipartRequest('POST', Uri.parse(url));

    // Add the input image and mask to the request
    request.files.add(await http.MultipartFile.fromPath(
      'input',
      _image!.path,
      contentType: MediaType('image', 'jpeg'),
    ));
    request.files.add(await http.MultipartFile.fromPath('mask', _mask!.path,
        contentType: MediaType('image', 'jpeg')));

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseB = await response.stream.bytesToString();
      Map<String, dynamic> result = jsonDecode(responseB);
      String output_base64 = result["output_image"]!;
      setState(() {
        imageStr = "Output image";
        imageData = base64Decode(output_base64);
        ref.read(outputimageProvider.notifier).state = imageData;
        myProviderListenable = outputimageProvider.notifier;
      });
      if (imageData != null) {
        Navigator.pushNamed(context, '/finalresult');
      } else {
        print("no image errorrrrrr");
      }
    } else {
      print("Error" + response.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: const Color.fromARGB(255, 1, 6, 29),
        shadowColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Image.asset(
            'assets/upload.jpg',
            height: 100,
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5, left: 50),
            child: Text(
              "Upload the image you want \n\t\t\t\t\t to see the result for",
              style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: const Color.fromARGB(255, 1, 6, 29)),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  _image != null
                      ? Image.file(_image!)
                      : Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[900],
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 70, vertical: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () => _getImage(ImageSource.gallery),
                            child: const Text('Select Image',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ),
                        ),
                  const SizedBox(height: 150),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          )),
                      onPressed: _inpaintImage,
                      child: const Text(
                        'Final Results',
                        style: TextStyle(
                            color: Color.fromRGBO(13, 71, 161, 1),
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (imageData != null)
            Expanded(
                child: Image.memory(
                    ref.watch(outputimageProvider.notifier).state!))
          else
            const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
