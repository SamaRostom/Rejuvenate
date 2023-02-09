import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejuvenate_mobile_app/services/user_services.dart';

import '../../models/user_model.dart';
import '../../providers/user_provider.dart';

class VerifyEmail extends ConsumerStatefulWidget {
  const VerifyEmail({super.key});

  @override
  ConsumerState<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends ConsumerState<VerifyEmail> {
  bool isEmailVerified = false;
   Timer? timer;
   
  @override
  void initState() {
    super.initState();
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isEmailVerified) {
      sendVerificationEmail();
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isEmailVerified) timer?.cancel();
  }

  void redirectToHome(String fname,String lname, String phone, String gender, DateTime birth) {
    UserService.saveUser(fname, lname, phone, gender, birth);
    UserService().getNewUserData().then((value) {
      UserModel user = UserModel.fromSnapshot(value);
      ref.read(newUserDataProivder.notifier).state = user;
      Navigator.of(context).pushNamedAndRemoveUntil('/viewprofile', (route) => false);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$e'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Center(
                child: Text('Verify email',
                    style: GoogleFonts.notoSansAdlam(fontSize: 25))),
          ),
          toolbarHeight: 100,
          backgroundColor: Colors.cyan,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: Center(
        child: SafeArea(
          child: (isEmailVerified)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome To Rejuvenate',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                           Colors.cyan,
                      ),
                      onPressed: () {
                        redirectToHome(data['fname'],data['lname'],data['phone'],data['gender'],data['birth']);
                      },
                      child: const Text('Continue'),
                    ),
                  ],
                )
              : Column(
                  children: [
                    const SizedBox(height: 40,),
                    const Text(
                      'Please Verify Your Email',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                             Colors.cyan,
                      ),
                      onPressed: () {
                        sendVerificationEmail();
                      },
                      child: const Text('Resend Verification Email'),
                    )
                  ],
                ),
        ),
      ),
      ),
    );
  }
}