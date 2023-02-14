import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejuvenate_mobile_app/services/user_services.dart';

import '../../utils/validations.dart';

class ForgetPassword extends ConsumerStatefulWidget {
  const ForgetPassword({super.key});

  @override
  ConsumerState<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends ConsumerState<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Center(
                child: Text('Reset Password',
                    style: GoogleFonts.notoSansAdlam(fontSize: 35))),
          ),
          toolbarHeight: 80,
          backgroundColor: Colors.cyan,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
        ),
        body: Form(
          key: _formKey,
          // child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 15, right: 15, bottom: 0),
                    child: Text("Recieve an email to reset your password",style: GoogleFonts.notoSansAdlam(fontSize: 25),textAlign: TextAlign.center,),
                  ),
                  //email
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 40, left: 15, right: 15, bottom: 0),
                    child: TextFormField(
                      controller: _emailController,
                      obscureText: false,
                      decoration: CommonStyle.textFieldStyle(
                          labelText: ("Enter your Email"), hintText: ("Email")),
                      validator: (value) {
                        if (!value!.isValidEmail) {
                          return 'Enter valid email';
                        }
                        if (value[value.length - 1] == '.') {
                          return 'Enter valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  //sign in button
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 10),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 15, right: 15, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // signUp();
                            UserService().resetPassword(
                                context, _emailController);
                          }
                        },
                        icon: const Icon(Icons.email_outlined),
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.red.withOpacity(0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                          ),
                        ),
                        label: const Center(
                          child: Text(
                            'Reset Password',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          // ),
        ),
      ),
    );
  }
}