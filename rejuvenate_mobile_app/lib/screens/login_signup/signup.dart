import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejuvenate_mobile_app/services/user_services.dart';

// import '../models/usermodel.dart';
import '../../utils/validations.dart';

enum GenderTypeEnum { male, female }

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupState();
}

class _SignupState extends ConsumerState<SignupScreen> {
  DateTime dateTime = DateTime(2000, 2, 1, 10, 20);
  String? gender;
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
        key: scaffoldKey,
        appBar: AppBar(
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child:
                Text('Sign Up', style: GoogleFonts.notoSansAdlam(fontSize: 45)),
          )),
          toolbarHeight: 100,
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
                //first name
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 0),
                  child: TextFormField(
                    controller: _fnameController,
                    obscureText: false,
                    decoration: CommonStyle.textFieldStyle(
                        labelText: ("Enter your first name"),
                        hintText: ("First name")),
                    validator: (value) {
                      if (!value!.isNotEmpty && !value.isValidName
                       ) {
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
                    obscureText: false,
                    decoration: CommonStyle.textFieldStyle(
                        labelText: ("Enter your last name"),
                        hintText: ("Last name")),
                    validator: (value) {
                      if (!value!.isNotEmpty && !value.isValidName) {
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
                    obscureText: false,
                    decoration: CommonStyle.textFieldStyle(
                        labelText: ("Enter your phone number"),
                        hintText: ("Phone number")),
                    validator: (value) {
                      if (!value!.isNotEmpty && !value.isValidPhone) {
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
                //   const Text("Gender",),
                //   RadioListTile(
                //     title: const Text("Male"),
                //     value: "male",
                //     groupValue: gender,
                //     onChanged: (value) {
                //       // setState(() {
                //       //   gender = value.toString();
                //       // });
                //     },
                //   ),
                // RadioListTile(
                //     title: const Text("Female"),
                //     value: "female",
                //     groupValue: gender,
                //     onChanged: (value) {
                //       // setState(() {
                //       //   gender = value.toString();
                //       // });
                //     },
                //   ),
                //   ],
                // ),

                //birthday
                Container(
                  color: Colors.transparent,
                  width: 380,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter your birthday date",
                        style: GoogleFonts.notoSansAdlam(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 23, 75, 82)),
                      ),
                      CupertinoButton(
                        child: Text(
                          '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                          style: GoogleFonts.notoSansAdlam(
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
                                    dateTimePickerTextStyle:
                                        TextStyle(color: Colors.white, fontSize: 25,),
                                  ),
                                ),
                                child: CupertinoDatePicker(
                                  backgroundColor:
                                      const Color.fromARGB(209, 1, 155, 175),
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
                    'Choose the Gender',
                    style: GoogleFonts.notoSansAdlam(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 23, 75, 82),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<GenderTypeEnum>(
                        value: GenderTypeEnum.male,
                        groupValue: _genderTypeEnum,
                        tileColor: Colors.transparent,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0)),
                        title: Text(GenderTypeEnum.male.name),
                        onChanged: (val) {
                          setState(() {
                            _genderTypeEnum = val;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: RadioListTile<GenderTypeEnum>(
                        value: GenderTypeEnum.female,
                        groupValue: _genderTypeEnum,
                        tileColor: Colors.transparent,
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                        ),
                        title: Text(GenderTypeEnum.female.name),
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
                const SizedBox(
                  height: 10.0,
                ),
                // DropdownButtonFormField(
                //   value: _selectedVal,
                //   items: _sugarTypeList
                //       .map((e) => DropdownMenuItem(
                //             value: e,
                //             child: Text(e),
                //           ))
                //       .toList(),
                //   onChanged: (val) {
                //     setState(() {
                //       _selectedVal = val;
                //     });
                //   },
                //   icon: const Icon(
                //     Icons.arrow_drop_down_circle,
                //     color: Colors.blue,
                //   ),
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
                // Confirm password
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 10),
                    child: TextFormField(
                      controller: _confirmpasswordController,
                      obscureText: true,
                      decoration: CommonStyle.textFieldStyle(
                          labelText: ("Confirm your Password"),
                          hintText: ("Password")),
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
                          UserService().signUp(ref, context, _fnameController, _lnameController, _phoneController, _genderController,  dateTime,  _emailController,
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
                      style: GoogleFonts.notoSansAdlam(
                          fontSize: 23, color: Colors.grey),
                    ),
                    TextButton(
                      child: Text(
                        'Login',
                        style: GoogleFonts.notoSansAdlam(
                            fontSize: 20,
                            decoration: TextDecoration.underline,
                            color: Colors.cyan),
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
