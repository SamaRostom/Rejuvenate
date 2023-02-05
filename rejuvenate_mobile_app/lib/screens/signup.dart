import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/validations.dart';


class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupState();
}

class _SignupState extends ConsumerState<SignupScreen> {
  String? gender;
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  final _birthController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    _birthController.dispose();
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
          title: Center(
              child: Padding(
                padding: const EdgeInsets.only(right:20.0),
                child: Text('Sign Up',
                    style: GoogleFonts.notoSansAdlam(fontSize: 45)),
              )),
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
                  //first name
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 0),
                    child: TextFormField(
                      controller: _fnameController,
                      obscureText: true,
                      decoration: CommonStyle.textFieldStyle(
                          labelText: ("Enter your first name"),
                          hintText: ("First name")),
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  //last name
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 0),
                    child: TextFormField(
                      controller: _lnameController,
                      obscureText: true,
                      decoration: CommonStyle.textFieldStyle(
                          labelText: ("Enter your last name"),
                          hintText: ("Last name")),
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  //phone
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 0),
                    child: TextFormField(
                      controller: _phoneController,
                      obscureText: true,
                      decoration: CommonStyle.textFieldStyle(
                          labelText: ("Enter your phone number"),
                          hintText: ("Phone number")),
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  //gender 
                  // Row(
                  //   children: [
                      const Text("Gender",),
                      RadioListTile(
                        title: const Text("Male"),
                        value: "male",
                        groupValue: gender,
                        onChanged: (value) {
                          // setState(() {
                          //   gender = value.toString();
                          // });
                        },
                      ),
                    RadioListTile(
                        title: const Text("Female"),
                        value: "female",
                        groupValue: gender,
                        onChanged: (value) {
                          // setState(() {
                          //   gender = value.toString();
                          // });
                        },
                      ),
                  //   ],
                  // ),

                  //email
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 0),
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
                        top: 20, left: 15, right: 15, bottom: 0),
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
                  const SizedBox(height: 10),
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
                            'Sign Up',
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
                'Already have an account?',
                style: GoogleFonts.notoSansAdlam(fontSize: 23, color: Colors.grey),
              ),
              TextButton(
                child: Text(
                  'Login',
                  style: GoogleFonts.notoSansAdlam(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      color:  const Color.fromARGB(246, 86, 203, 209)),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
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
