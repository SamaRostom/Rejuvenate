import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rejuvenate_mobile_app/widgets/answer_type.dart';

import '../widgets/custom_text.dart';

enum GenderTypeEnum { Male, Female }

enum AnswerTypeEnum { Yes, NO }

class PatientReport extends StatefulWidget {
  const PatientReport({super.key});

  @override
  State<PatientReport> createState() => _PatientReportState();
}

class _PatientReportState extends State<PatientReport> {
  DateTime dateTime = DateTime(2000, 2, 1, 10, 20);
  _PatientReportState() {
    _selectedVal = _sugarTypeList[0];
  }
  GenderTypeEnum? _genderTypeEnum;
  AnswerTypeEnum? _answerTypeEnum;
  AnswerTypeEnum? _answerrTypeEnum;
  AnswerTypeEnum? _answerrrTypeEnum;
  final _sugarTypeList = ["Sugar Type 1", "Sugar Type 2", "NONE"];
  String? _selectedVal = "Sugar Type 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Fill the Form'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.cyan,
                  ),
                ],
                text: 'Fill the Form',
                fontSize: 60,
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                          const BorderSide(color: Colors.cyan, width: 2.0)),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Choose the Gender',
                style: TextStyle(
                    color: Color.fromARGB(255, 23, 75, 82),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<GenderTypeEnum>(
                      value: GenderTypeEnum.Male,
                      groupValue: _genderTypeEnum,
                      tileColor: Colors.cyan.shade200,
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
                      tileColor: Colors.cyan.shade200,
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
                height: 10.0,
              ),
              DropdownButtonFormField(
                value: _selectedVal,
                items: _sugarTypeList
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
                  color: Colors.cyan,
                ),
                decoration: InputDecoration(
                    labelText: "Sugar Types",
                    prefixIcon: const Icon(
                      Icons.accessibility_new_rounded,
                      color: Colors.cyan,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2.0))),
              ),
              const SizedBox(height: 10.0),
              //BLOOD
              const Text(
                'Do you have Blood Pressure?',
                style: TextStyle(
                    color: Color.fromARGB(255, 23, 75, 82),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<AnswerTypeEnum>(
                      value: AnswerTypeEnum.Yes,
                      groupValue: _answerTypeEnum,
                      tileColor: Colors.cyan.shade200,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                              color: Colors.white, width: 2.0)),
                      title: Text(AnswerTypeEnum.Yes.name),
                      onChanged: (val) {
                        setState(() {
                          _answerTypeEnum = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: RadioListTile<AnswerTypeEnum>(
                      value: AnswerTypeEnum.NO,
                      groupValue: _answerTypeEnum,
                      tileColor: Colors.cyan.shade200,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                      ),
                      title: Text(AnswerTypeEnum.NO.name),
                      onChanged: (val) {
                        setState(
                          () {
                            _answerTypeEnum = val;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //Problems
              const Text(
                'Do you have any known cardiovascular problems (abnormal ECG, previous heart attack, etc)?',
                style: TextStyle(
                    color: Color.fromARGB(255, 23, 75, 82),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<AnswerTypeEnum>(
                      value: AnswerTypeEnum.Yes,
                      groupValue: _answerrTypeEnum,
                      tileColor: Colors.cyan.shade200,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                              color: Colors.white, width: 2.0)),
                      title: Text(AnswerTypeEnum.Yes.name),
                      onChanged: (val) {
                        setState(() {
                          _answerrTypeEnum = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: RadioListTile<AnswerTypeEnum>(
                      value: AnswerTypeEnum.NO,
                      groupValue: _answerrTypeEnum,
                      tileColor: Colors.cyan.shade200,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                      ),
                      title: Text(AnswerTypeEnum.NO.name),
                      onChanged: (val) {
                        setState(
                          () {
                            _answerrTypeEnum = val;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Has your doctor ever told you that your cholesterol was too high?',
                style: TextStyle(
                    color: Color.fromARGB(255, 23, 75, 82),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const AnswerType(
                  // children: [
                  //   Expanded(
                  //     child: RadioListTile<AnswerTypeEnum>(
                  //       value: AnswerTypeEnum.Yes,
                  //       groupValue: _answerrrTypeEnum,
                  //       tileColor: Colors.cyan.shade200,
                  //       shape: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(20.0),
                  //           borderSide: const BorderSide(
                  //               color: Colors.white, width: 2.0)),
                  //       title: Text(AnswerTypeEnum.Yes.name),
                  //       onChanged: (val) {
                  //         setState(() {
                  //           _answerrrTypeEnum = val;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  //   const SizedBox(
                  //     width: 5.0,
                  //   ),
                  //   Expanded(
                  //     child: RadioListTile<AnswerTypeEnum>(
                  //       value: AnswerTypeEnum.NO,
                  //       groupValue: _answerrrTypeEnum,
                  //       tileColor: Colors.cyan.shade200,
                  //       shape: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(20.0),
                  //         borderSide:
                  //             const BorderSide(color: Colors.white, width: 2.0),
                  //       ),
                  //       title: Text(AnswerTypeEnum.NO.name),
                  //       onChanged: (val) {
                  //         setState(
                  //           () {
                  //             _answerrrTypeEnum = val;
                  //           },
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ],
                  ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Do you have any injuries or orthopedic problems (leg, knees, etc)?',
                style: TextStyle(
                    color: Color.fromARGB(255, 23, 75, 82),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const AnswerType(
                  // children: [
                  //   Expanded(
                  //     child: RadioListTile<AnswerTypeEnum>(
                  //       value: AnswerTypeEnum.Yes,
                  //       groupValue: _answerTypeEnum,
                  //       tileColor: Colors.cyan.shade200,
                  //       shape: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(20.0),
                  //           borderSide: const BorderSide(
                  //               color: Colors.white, width: 2.0)),
                  //       title: Text(AnswerTypeEnum.Yes.name),
                  //       onChanged: (val) {
                  //         setState(() {
                  //           _answerTypeEnum = val;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  //   const SizedBox(
                  //     width: 5.0,
                  //   ),
                  //   Expanded(
                  //     child: RadioListTile<AnswerTypeEnum>(
                  //       value: AnswerTypeEnum.NO,
                  //       groupValue: _answerTypeEnum,
                  //       tileColor: Colors.cyan.shade200,
                  //       shape: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(20.0),
                  //         borderSide:
                  //             const BorderSide(color: Colors.white, width: 2.0),
                  //       ),
                  //       title: Text(AnswerTypeEnum.NO.name),
                  //       onChanged: (val) {
                  //         setState(
                  //           () {
                  //             _answerTypeEnum = val;
                  //           },
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ],
                  ),
            ]),
          ),
        ),
      ),
    );
  }
}
