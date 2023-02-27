// import 'dart:ffi';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class UploadImage extends StatefulWidget {
//   const UploadImage({super.key});

//   @override
//   State<UploadImage> createState() => _UploadImageState();
// }

// class _UploadImageState extends State<UploadImage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.blue),
//                   padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
//                   textStyle: MaterialStateProperty.all(
//                       const TextStyle(fontSize: 14, color: Colors.white))),
//               onPressed: () {
//                 setState(() {});
//               },
//               child: Column(
//                 children: const [
//                   Icon(Icons.image_outlined),
//                   Text(
//                     'Pick Gallery',
//                     style: TextStyle(),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10.0),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//               ),
//               onPressed: () {},
//               child: Column(
//                 children: const [
//                   Icon(Icons.camera_alt_outlined),
//                   Text(
//                     'Pick Camera',
//                     style: TextStyle(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
//import http package manually

class ImageUpload extends StatefulWidget {
  const ImageUpload({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ImageUpload();
  }
}

class _ImageUpload extends State<ImageUpload> {
  File? uploadimage; //variable for choosed file

  Future<void> chooseImage() async {
    var choosedimage = await ImagePicker.pickImage(source: ImageSource.gallery);
    //set source: ImageSource.camera to get image from camera
    setState(() {
      uploadimage = choosedimage as File?;
    });
  }

  Future<void> uploadImage() async {
    //show your own loading or progressing code here

    String uploadurl = "http://192.168.100.16/test/image_upload.php";
    //dont use http://localhost , because emulator don't get that address
    //insted use your local IP address or use live URL
    //hit "ipconfig" in windows or "ip a" in linux to get you local IP

    try {
      List<int> imageBytes = uploadimage?.readAsBytesSync() as List<int>;
      String baseimage = base64Encode(imageBytes);
      //convert file image to Base64 encoding
      var response = await http.post(uploadurl, body: {
        'image': baseimage,
      });
      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body); //decode json data
        if (jsondata["error"]) {
          //check error sent from server
          print(jsondata["msg"]);
          //if error return from server, show message from server
        } else {
          print("Upload successful");
        }
      } else {
        print("Error during connection to server");
        //there is error during connecting to server,
        //status code might be 404 = url not found
      }
    } catch (e) {
      print("Error during converting to Base64");
      //there is error during converting file image to base64 encoding.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Image to Server"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        height: 300,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //content alignment to center
          children: <Widget>[
            Container(
                //show image here after choosing image
                child: uploadimage == null
                    ? Container()
                    : //if uploadimage is null then show empty container
                    SizedBox(
                        height: 150,
                        child: Image.file(uploadimage!) //load image from file
                        )),
            Container(
                //show upload button after choosing image
                child: uploadimage == null
                    ? Container()
                    : //if uploadimage is null then show empty container
                    ElevatedButton.icon(
                        onPressed: () {
                          uploadImage();
                          //start uploading image
                        },
                        icon: const Icon(Icons.file_upload),
                        label: const Text("UPLOAD IMAGE"),
                        // color: Colors.deepOrangeAccent,
                        // colorBrightness: Brightness.dark,
                        //set brghtness to dark, because deepOrangeAccent is darker coler
                        //so that its text color is light
                      )),
            ElevatedButton.icon(
              onPressed: () {
                chooseImage(); // call choose image function
              },
              icon: const Icon(Icons.folder_open),
              label: const Text("CHOOSE IMAGE"),
              // icon: Colors.deepOrangeAccent,
              // colorBrightness: Brightness.dark,
            )
          ],
        ),
      ),
    );
  }
}
