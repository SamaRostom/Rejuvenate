
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';



class PreviewPage extends StatelessWidget {
  const PreviewPage({Key? key, required this.myfile}) : super(key: key);

  final XFile myfile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(
              "Preview Page",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 28, color: Colors.white),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Image.file(File(myfile.path), fit: BoxFit.cover, width:350,height:350 ,alignment:Alignment.center),
              const SizedBox(height: 24),
              Text(myfile.name),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.cyan),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20)),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(fontSize: 14, color: Colors.white))),
                onPressed: () async {
                  Navigator.of(context).pushNamed('/finalresult');
                },
                
                child: Column(
                  children: const [
                    Icon(Icons.check_outlined),
                    Text(
                      'Final Result',
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