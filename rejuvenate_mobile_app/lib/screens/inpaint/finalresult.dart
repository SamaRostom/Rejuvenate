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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(
              "Final Result",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 28, color: Colors.white),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 600.0,
                width: 450.0,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: BeforeAfter(
                  isVertical: false,
                  beforeImage: Image.asset('assets/baby2.jpg'),
                  afterImage: Image.asset('assets/baby2.png'),
                  thumbColor: Colors.cyan,
                  thumbRadius: 15.0,
                  overlayColor: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
