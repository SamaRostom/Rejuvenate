import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejuvenate_mobile_app/services/user_services.dart';

import '../../config/size_config.dart';
import '../../utils/validations.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginState();
}

class _LoginState extends ConsumerState<LoginScreen> {
  String? gender;
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;
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
    SizeConfig().init(context);
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
                //email
                Padding(
                  padding: const EdgeInsets.only(
                      top: 50, left: 15, right: 15, bottom: 0),
                  child: TextFormField(
                    controller: _emailController,
                    obscureText: false,
                    decoration: CommonStyle.textFieldStyle2(
                        labelText: ("Email"),
                        prefixIcon: const Icon(Icons.email_outlined)),
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
                    obscureText: passwordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    decoration: CommonStyle.textFieldStyle2(
                      labelText: ("Password"),
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(
                              () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          }),
                    ),
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
                      top: 10, left: 15, right: 15, bottom: 10),
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
                          UserService().signIn(ref, context, _emailController,
                              _passwordController);
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
                    TextButton(
                      child: Text(
                        'Forget Password?',
                        style: GoogleFonts.notoSansAdlam(
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            color: Colors.cyan),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/forgetpassword');
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Create a new account',
                      style: GoogleFonts.notoSansAdlam(
                          fontSize: 23, color: Colors.grey),
                    ),
                    TextButton(
                      child: Text(
                        'Signup',
                        style: GoogleFonts.notoSansAdlam(
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            color: Colors.cyan),
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
