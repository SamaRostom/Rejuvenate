import 'package:before_after_image_slider_nullsafty/before_after_image_slider_nullsafty.dart';
import 'package:flutter/material.dart';

class FinalResult extends StatefulWidget {
  const FinalResult({super.key});
  @override
  State<FinalResult> createState() => _FinalResultState();
}

class _FinalResultState extends State<FinalResult> {
  @override
  Widget build(BuildContext context) {
      // padding: const EdgeInsets.symmetric(horizontal: 24),
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
      child: Center(
      child: Column(
        // height: 24.0,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),

          Container(
            height: 600.0,
            width: 450.0,
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
          child: BeforeAfter(
              isVertical: true,
              beforeImage: Image.asset('assets/Final1Test.jpg'),
              afterImage: Image.asset('assets/Final2Test.jpg'),
              thumbColor: Colors.cyan,
              thumbRadius: 15.0,
              overlayColor: Colors.grey,
            ),
          ),

        ],
        
      ),),),
    );
  }
}
