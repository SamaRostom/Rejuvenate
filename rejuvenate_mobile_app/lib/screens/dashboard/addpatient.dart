// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/constants.dart';
import '../../../utils/side_menu.dart';
import '../../../utils/validations.dart';
import '../../services/user_services.dart';

enum GenderTypeEnum { Male, Female }

class AddPatient extends ConsumerStatefulWidget {
  const AddPatient({super.key});

  @override
  ConsumerState<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends ConsumerState<AddPatient> {
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
  final _problemController = TextEditingController();
  _AddPatientState() {
    _selectedVal = _problemList[0];
  }

  final _problemList = ["Cleft Lip"];
  String _selectedVal = "Choose a problem";

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _genderController.dispose();
    _birthController.dispose();
    _passwordController.dispose();
    _problemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: loggedin == true ? const SideMenu1() : const SideMenu2(),
        appBar: AppBar(
          title: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 20),
            child: Text('Add Patient',
                style: GoogleFonts.robotoSlab(
                    fontSize: 40, fontWeight: FontWeight.bold)),
          )),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          foregroundColor: const Color.fromARGB(255, 1, 6, 29),
          shadowColor: Colors.white,
        ),
        body: Form(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 0),
                  child: TextFormField(
                    controller: _fnameController,
                    obscureText: false,
                    decoration: CommonStyle.textFieldStyle3(
                        labelText: ("First name"),
                        prefixIcon: const Icon(Icons.person_outlined)),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 0),
                  child: TextFormField(
                    controller: _lnameController,
                    obscureText: false,
                    decoration: CommonStyle.textFieldStyle3(
                        labelText: ("Last name"),
                        prefixIcon: const Icon(Icons.person_outlined)),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 0),
                  child: TextFormField(
                    controller: _phoneController,
                    obscureText: false,
                    decoration: CommonStyle.textFieldStyle3(
                        labelText: ("Phone number"),
                        prefixIcon: const Icon(Icons.phone_outlined)),
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
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 0),
                  child: TextFormField(
                    controller: _problemController,
                    obscureText: false,
                    decoration: CommonStyle.textFieldStyle3(
                        labelText: ("Problem Type"),
                        prefixIcon: const Icon(Icons.report_problem_outlined)),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: Colors.transparent,
                  width: 380,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter birthdate",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 1, 6, 29),
                        ),
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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Text(
                    'Choose the Gender',
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
                    const SizedBox(
                      width: 5.0,
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[900],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40))),
                      onPressed: () {
                        if (_fnameController.text.isNotEmpty &&
                            _lnameController.text.isNotEmpty &&
                            _phoneController.text.isNotEmpty &&
                            _emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty &&
                            _problemController.text.isNotEmpty) {
                          UserService().signUppatient(
                              ref,
                              context,
                              _fnameController,
                              _lnameController,
                              _phoneController,
                              _genderController,
                              dateTime,
                              _emailController,
                              _passwordController,
                              _problemController);

                          Navigator.pushNamed(context, '/dashboard');
                        }
                        // signUp();
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
