
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/validations.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginScreen> {
  String? gender;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
                child: Text('Log in',
                    style: GoogleFonts.notoSansAdlam(fontSize: 45))),
          ),
          toolbarHeight: 100,
          backgroundColor: const Color.fromARGB(246, 86, 203, 209),
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
                  //email
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 15, right: 15, bottom: 0),
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

                  //password
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30, left: 15, right: 15, bottom: 0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: CommonStyle.textFieldStyle(
                          labelText: ("Enter your Password"),
                          hintText: ("Password")),
                      validator: (value) {
                        if (!value!.isValidPassword) {
                          return 'enter At Least 8 characters one letter and one number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 60),
                  //sign in button
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 0),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 5, left: 15, right: 15, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // signUp();
                            // UserHelper().signUp(
                            //     context, _emailController, _passwordController);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: Colors.red.withOpacity(0),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(2),
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Log in',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Create a new account',
                        style: GoogleFonts.notoSansAdlam(fontSize: 23, color: Colors.grey),
                      ),
                      TextButton(
                        child: Text(
                          'Signup',
                          style: GoogleFonts.notoSansAdlam(
                              fontSize: 20,
                              decoration: TextDecoration.underline,
                              color:  const Color.fromARGB(246, 86, 203, 209)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/signup');
                        },
                      )
                    ],
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