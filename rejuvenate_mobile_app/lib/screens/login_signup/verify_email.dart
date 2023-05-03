import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejuvenate_mobile_app/services/user_services.dart';
import '../../models/user_model.dart';
import '../../providers/user_provider.dart';
import '../../widgets/loading_widget.dart';

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

  void redirectToHome(String fname, String lname, String phone, String gender,
      DateTime birth) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const Center(
            child: LoadingWidget(),
          );
        });
    await UserService.saveUser(fname, lname, phone, gender, birth);
    await UserService().getNewUserData().then((value) {
      String Id = value[1];
      dynamic data = value[0];
      UserModel user = UserModel.fromSnapshot(data, Id);
      ref.read(newUserDataProivder.notifier).state = user;
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/login', (route) => false);
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
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          foregroundColor: Colors.grey,
          shadowColor: Colors.white,
        ),
        body: Center(
          child: SafeArea(
            child: (isEmailVerified)
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Welcome To Rejuvenate',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 1, 6, 29)),
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                        ),
                        onPressed: () {
                          redirectToHome(data['fname'], data['lname'],
                              data['phone'], data['gender'], data['birth']);
                        },
                        child: const Text('Continue'),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Image.asset(
                        'assets/verify.png',
                        height: 400,
                        width: 400,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Please Verify Your Email',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 1, 6, 29)),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                        ),
                        onPressed: () {
                          sendVerificationEmail();
                        },
                        child: const Text(
                          'Resend Verification Email',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
