import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum GenderTypeEnum { Male, Female }

class PatientReport extends StatefulWidget {
  static const routeName = "/patientreport";

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
  final _sugarTypeList = ["Sugar Type 1", "Sugar Type 2", "NONE"];
  String? _selectedVal = "Sugar Type 1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill the Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Name', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10.0),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Age', border: OutlineInputBorder()),
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
                        backgroundColor: Colors.lightBlue,
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
            // const Text(
            //   'Gender',
            //   textAlign: TextAlign.right,
            // ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<GenderTypeEnum>(
                    value: GenderTypeEnum.Male,
                    groupValue: _genderTypeEnum,
                    tileColor: Colors.blue.shade50,
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
                    tileColor: Colors.blue.shade50,
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
              decoration: const InputDecoration(
                  labelText: "Sugar Types",
                  prefixIcon: Icon(
                    Icons.accessibility_new_rounded,
                    color: Colors.blue,
                  ),
                  border: OutlineInputBorder()),
            ),
          ]),
        ),
      ),
    );
  }
}
