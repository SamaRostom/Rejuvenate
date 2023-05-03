import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      // _mask = File('C:\\x\\htdocs\\Graduation\\Rejuvenate\\rejuvenate_mobile_app\\assets\\31.jpg');
      _mask = File(pickedFile!.path);
    });
  }

  Future<void> _inpaintImage() async {
    // _mask = File('C:\\x\\htdocs\\Graduation\\Rejuvenate\\rejuvenate_mobile_app\\assets\\31.jpg');
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
    // request.files.add(await http.MultipartFile.fromPath('mask','D:/Graduation project/Mask generation/Steamsamayurkey/masked2/31.jpg',
    //     contentType: MediaType('image', 'jpeg')));
    request.files.add(await http.MultipartFile.fromPath('mask', _mask!.path,
        contentType: MediaType('image', 'jpeg')));  

    // Send the request and wait for the response
    // final response = await http.Response.fromStream(await request.send());

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
       }
       else{
        print("no image errorrrrrr");
       }
    } else {
      print("Error"+ response.statusCode.toString());
    }

    // Decode the response into an image and update the state
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _image != null?Image.file(_image!):
                  ElevatedButton(
                     style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[900]),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(50, 20, 70, 20)),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 20, color: Colors.white))),
                    onPressed: () => _getImage(ImageSource.gallery),
                    child: const Text('Select Image'),
                  ),
                  _mask != null?Image.file(_mask!):
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[900]),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(50, 20, 70, 20)),
                        textStyle: MaterialStateProperty.all(const TextStyle(
                            fontSize: 20, color: Colors.white))),
                    onPressed: () => _getMask(ImageSource.gallery),
                    child: const Text('Select Mask'),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
            onPressed: _inpaintImage,
             child: const Text(
                  'Final Results',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
          ),
          // if (imageData != null) Expanded(child: Image.memory(ref.watch(outputimageProvider.notifier).state!) )
          // else const CircularProgressIndicator(),
        ],
      ),
    );
  }
}