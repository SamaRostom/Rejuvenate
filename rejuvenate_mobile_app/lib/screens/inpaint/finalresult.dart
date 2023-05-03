import 'package:before_after_image_slider_nullsafty/before_after_image_slider_nullsafty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../providers/inpaint_provider.dart';

class FinalResult extends ConsumerStatefulWidget {
  const FinalResult({super.key});
  @override
  ConsumerState<FinalResult> createState() => _FinalResultState();
}

class _FinalResultState extends ConsumerState<FinalResult> {
  late final myProviderListenable = outputimageProvider.notifier;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: const Color.fromARGB(255, 1, 6, 29),
        shadowColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5, left: 20),
                child: Text(
                  "Final Results",
                  style: GoogleFonts.nunitoSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: const Color.fromARGB(255, 1, 6, 29)),
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                height: 500.0,
                width: 400.0,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                child: BeforeAfter(
                  isVertical: false,
                  beforeImage: Image.asset('assets/baby.jpg',width:350 ,height:350 ,fit: BoxFit.fill,),
                  afterImage:  Image.memory(ref.watch(outputimageProvider.notifier).state!,width:350 ,height:350 ,fit: BoxFit.fill,),
                  thumbColor: const Color.fromRGBO(13, 71, 161, 1),
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
