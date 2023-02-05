import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

enum GenderTypeEnum { Male, Female }

enum AnswerTypeEnum { Yes, NO }

class PatientReport extends StatefulWidget {
  static const routeName = "/patient-report";

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
        child: Form(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const CustomText(
              shadows: [
                Shadow(
                  blurRadius: 30,
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
                        const BorderSide(color: Colors.blue, width: 2.0)),
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0)),
                labelText: 'Age',
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: CupertinoButton(
                child: Text(
                  '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                ),
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                        backgroundColor: Colors.blue,
                        initialDateTime: dateTime,
                        onDateTimeChanged: (DateTime newTime) {
                          setState(() => dateTime = newTime);
                        },
                        use24hFormat: true,
                        mode: CupertinoDatePickerMode.date,
                      ),
                    ),
                  );
                },
              ),
            ),
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
                    tileColor: Colors.blue.shade200,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0)),
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
                    tileColor: Colors.blue.shade200,
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
                color: Colors.blue,
              ),
              decoration: InputDecoration(
                  labelText: "Sugar Types",
                  prefixIcon: const Icon(
                    Icons.accessibility_new_rounded,
                    color: Colors.blue,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                          const BorderSide(color: Colors.cyan, width: 2.0))),
            ),
            const SizedBox(height: 10.0),
            //BLOOD
            const Text(
              'Do you have Blood Pressure',
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
                    tileColor: Colors.blue.shade200,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0)),
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
                    tileColor: Colors.blue.shade200,
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
          ]),
        ),
      ),
    );
  }
}
