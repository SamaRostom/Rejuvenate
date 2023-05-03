import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejuvenate_mobile_app/services/user_services.dart';
import '../../utils/validations.dart';

enum GenderTypeEnum { Male, Female }

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupState();
}

class _SignupState extends ConsumerState<SignupScreen> {
  DateTime dateTime = DateTime(2000, 2, 1, 10, 20);
  String? gender;
  bool passwordVisible = false;
  GenderTypeEnum? _genderTypeEnum;
  final _formKey = GlobalKey<FormState>();
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  final _birthController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    _birthController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          foregroundColor: const Color.fromARGB(255, 1, 6, 29),
          shadowColor: Colors.white,
        ),
        body: Form(
          key: _formKey,
          // child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/login.png', fit: BoxFit.cover,height: 350,),
                Padding(
                  padding: const EdgeInsets.only(right: 250),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.nunitoSans(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: const Color.fromARGB(255, 1, 6, 29)),
                  ),
                ),
                //first name
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 0),
                  child: TextFormField(
                    controller: _fnameController,
                    obscureText: false,
                    decoration: CommonStyle.textFieldStyle3(
                        labelText: ("First name"),
                        prefixIcon: const Icon(Icons.person_outlined)),
                    validator: (value) {
                      if (!value!.isNotEmpty && !value.isValidName) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                ),
                //last name
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 0),
                  child: TextFormField(
                    controller: _lnameController,
                    obscureText: false,
                    decoration: CommonStyle.textFieldStyle3(
                        labelText: ("Last name"),
                        prefixIcon: const Icon(Icons.person_outlined)),
                    validator: (value) {
                      if (!value!.isNotEmpty && !value.isValidName) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                  ),
                ),
                //phone
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 0),
                  child: TextFormField(
                    controller: _phoneController,
                    obscureText: false,
                    decoration: CommonStyle.textFieldStyle3(
                        labelText: ("Phone number"),
                        prefixIcon: const Icon(Icons.phone_outlined)),
                    validator: (value) {
                      if (!value!.isNotEmpty && !value.isValidPhone) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                ),
                //email
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 0),
                  child: TextFormField(
                    controller: _emailController,
                    obscureText: false,
                    decoration: CommonStyle.textFieldStyle3(
                        labelText: ("Email"),
                        prefixIcon: const Icon(Icons.alternate_email_outlined)),
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
                    obscureText: passwordVisible,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    decoration: CommonStyle.textFieldStyle3(
                      labelText: ("Password"),
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
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
                        return 'Enter At Least 8 characters one letter and one number';
                      }
                      return null;
                    },
                  ),
                ),
                // Confirm password
                Padding(
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, right: 15, bottom: 10),
                  child: TextFormField(
                    controller: _confirmpasswordController,
                    obscureText: true,
                    decoration: CommonStyle.textFieldStyle3(
                      labelText: ("Confirm Password"),
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined),
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
                      if (value != _passwordController.value.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                ),
                //birthday
                Container(
                  color: Colors.transparent,
                  width: 380,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter your birthday date",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 1, 6, 29)),
                      ),
                      CupertinoButton(
                        child: Text(
                          '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                          style: GoogleFonts.nunitoSans(
                              fontSize: 23, color: Colors.grey),
                        ),
                        onPressed: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) => SizedBox(
                              height: 230,
                              child: CupertinoTheme(
                                data: const CupertinoThemeData(
                                  textTheme: CupertinoTextThemeData(
                                    dateTimePickerTextStyle: TextStyle(
                                      color: Color.fromARGB(255, 1, 6, 29),
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                child: CupertinoDatePicker(
                                  backgroundColor: Colors.white,
                                  initialDateTime: dateTime,
                                  onDateTimeChanged: (DateTime newTime) {
                                    setState(() => dateTime = newTime);
                                  },
                                  use24hFormat: true,
                                  mode: CupertinoDatePickerMode.date,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                //gender
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Text(
                    'Choose Gender',
                    style: GoogleFonts.nunitoSans(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 1, 6, 29),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<GenderTypeEnum>(
                        value: GenderTypeEnum.Male,
                        groupValue: _genderTypeEnum,
                        tileColor: Colors.transparent,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0)),
                        title: Text(GenderTypeEnum.Male.name),
                        onChanged: (val) {
                          setState(() {
                            _genderTypeEnum = val;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<GenderTypeEnum>(
                        value: GenderTypeEnum.Female,
                        groupValue: _genderTypeEnum,
                        tileColor: Colors.transparent,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                        ),
                        title: Text(GenderTypeEnum.Female.name),
                        onChanged: (val) {
                          setState(
                            () {
                              _genderTypeEnum = val;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                //sign in button
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 0),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 5, left: 15, right: 15, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // signUp();
                          UserService().signUp(
                              ref,
                              context,
                              _fnameController,
                              _lnameController,
                              _phoneController,
                              _genderController,
                              dateTime,
                              _emailController,
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
                      style: GoogleFonts.nunitoSans(
                          fontSize: 23, color: Colors.grey),
                    ),
                    TextButton(
                      child: Text(
                        'Login',
                        style: GoogleFonts.nunitoSans(
                            fontSize: 25,
                            decoration: TextDecoration.underline,
                            color: Colors.blue[700]),
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
