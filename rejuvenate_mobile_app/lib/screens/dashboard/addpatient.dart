// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/constants.dart';
import '../../../utils/side_menu.dart';
import '../../../utils/validations.dart';

enum GenderTypeEnum { Male, Female }

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  State<AddPatient> createState() => _AddPatientState();
}

class _AddPatientState extends State<AddPatient> {
  DateTime dateTime = DateTime(2000, 2, 1, 10, 20);
  String? gender;
  bool passwordVisible = false;
  GenderTypeEnum? _genderTypeEnum;
  _AddPatientState() {
    _selectedVal = _problemList[0];
  }

  final _problemList = ["Cleft Lip"];
  String? _selectedVal = "Choose a problem";

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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 0),
                  child: TextFormField(
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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 0),
                  child: TextFormField(
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
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: DropdownButtonFormField(
                    value: _selectedVal,
                    items: _problemList
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedVal = val;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Color.fromRGBO(13, 71, 161, 1),
                    ),
                    decoration: const InputDecoration(
                      labelText: "Problems",
                      // enabledBorder: OutlineInputBorder(
                      //     borderRadius: BorderRadius.circular(50.0),
                      //     borderSide: const BorderSide(
                      //         color: Colors.cyan, width: 2.0))
                    ),
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
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                child: CupertinoDatePicker(
                                  backgroundColor:
                                      const Color.fromARGB(255, 1, 6, 29),
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
                        Navigator.pushNamed(context, '/dashboard');
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
