// // import '../models/seemoregames_model.dart';
// // import 'package:http/http.dart' as http;

// // class SeeMoreGamesService {
// //   getData() async {
// //     // var client = http.Client();

// //     // var uri = Uri.parse("https://www.freetogame.com/api/games");
// //     // var response = await client.get(uri);

// //     // if(response.statusCode == 200){
// //     //   String jsonString = response.body;
// //     //   return seeMoreGamesModelFromJson(jsonString);
// //     // }
// //     var request = http.Request(
// //         'GET',
// //         Uri.parse(
// //             'https://api.newnative.ai/stable-diffusion?prompt=futuristic'));

// //     http.StreamedResponse response = await request.send();

// //     if (response.statusCode == 200) {
// //       print(await response.stream.bytesToString());
// //     } else {
// //       print(response.reasonPhrase);
// //     }
// //   }
// // }

// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';

// import '../providers/inpaint_provider.dart';

// class InpaintService{
//   File? _mask = Image.asset('assets/31.jpg', fit: BoxFit.cover) as File?;
//   Uint8List? _outputImage;
//   Image? image2;
//   String? imageStr;
//   Uint8List? imageData;
//    Future<void> _inpaintImage(ref) async {
//     if (ref.watch(imageProivder) == null || _mask == null) {
//       return;
//     }
  
//     final url = 'http://10.6.2.243:8000/inpaint';
//     final request = http.MultipartRequest('POST', Uri.parse(url));

//     // Add the input image and mask to the request
//     request.files.add(await http.MultipartFile.fromPath(
//       'input',
//       ref.read(imageProivder.notifier).state!.path,
//       contentType: MediaType('image', 'jpeg'),
//     ));
//     request.files.add(await http.MultipartFile.fromPath('mask', _mask!.path,
//         contentType: MediaType('image', 'jpeg')));

//     // Send the request and wait for the response
//     // final response = await http.Response.fromStream(await request.send());

//     final response = await request.send();
//     if (response.statusCode == 200) {
//       final responseB = await response.stream.bytesToString();
//       Map<String, dynamic> result = jsonDecode(responseB);
//       String output_base64 = result["output_image"]!;
//       setState(() {
//         imageStr = "Output image";
//         imageData = base64Decode(output_base64);
//       });
//     } else {
//       print("Error"+ response.statusCode.toString());
//     }
//   }
// }