import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rejuvenate_mobile_app/widgets/answer_type.dart';
import '../widgets/custom_text.dart';

enum GenderTypeEnum { Male, Female }

Future<void> add(String id) async {
  WidgetsFlutterBinding.ensureInitialized();
}

class PatientReport extends StatefulWidget {
  const PatientReport({super.key});

  @override
  State<PatientReport> createState() => _PatientReportState();

  // static saveScore(WidgetRef ref) async {
  //   final FirebaseFirestore db = FirebaseFirestore.instance;
  //   final score = FirebaseAuth.instance.currentUser!;
  //   final tog = ref.watch(typeofgameProivder);
  //   final scoreProvider = ref.watch(scoreProivder);
  //   final  finalScoreUserRef = await db.collection("PatientReport").where("email", isEqualTo: score.email).where("typeofgame", isEqualTo: tog).get();
  //   final scoreCollection = db.collection("Scores").doc();
  //   Map<String, dynamic> userData = {
  //     "email": score.email,
  //     "score": scoreProvider,
  //     "date": DateTime.now(),
  //     "typeofgame": tog,
  //   };
  //   if (finalScoreUserRef.docs.isEmpty) {
  //     await scoreCollection.set(userData);
  //   } else {
  //     if(finalScoreUserRef.docs.first.get('score') < scoreProvider){
  //       finalScoreUserRef.docs.first.reference.update(userData);
  //     }
  //   }
  // }
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
        backgroundColor: Colors.cyan,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50.0),
            child: Text(
              "Fill the Form",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontSize: 28, color: Colors.white),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.cyan,
                      ),
                    ],
                    text: 'Please Enter Your Data',
                    fontSize: 30,
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
                            borderSide: const BorderSide(
                                color: Colors.white, width: 2.0),
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
                            borderSide: const BorderSide(
                                color: Colors.cyan, width: 2.0))),
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
                  const AnswerType(),
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
                  const AnswerType(),
                  const SizedBox(
                    height: 10,
                  ),
                  //cholesterol
                  const Text(
                    'Has your doctor ever told you that your cholesterol was too high?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 75, 82),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const AnswerType(),
                  const SizedBox(
                    height: 10,
                  ),
                  //injuries
                  const Text(
                    'Do you have any injuries (leg, knees, etc)?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 75, 82),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const AnswerType(),
                  const SizedBox(
                    height: 10,
                  ),
                  //joints
                  const Text(
                    'Do you have stiff or swollen joints?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 75, 82),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const AnswerType(),
                  const SizedBox(
                    height: 10,
                  ),
                  //medicine
                  const Text(
                    'Are you taking any prescribed medications or dietary supplementation?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 75, 82),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const AnswerType(),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "If yes enter the name of the medicine",
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 75, 82),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              const BorderSide(color: Colors.cyan, width: 2.0)),
                      labelText: 'Medicine name',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //soreness وجع
                  const Text(
                    'Do you have soreness in any area?',
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 75, 82),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const AnswerType(),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Do you have any other medical condition, injury or anything else we should be aware of that we have not mentioned?",
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 75, 82),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const AnswerType(),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "If yes enter the condition",
                    style: TextStyle(
                        color: Color.fromARGB(255, 23, 75, 82),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              const BorderSide(color: Colors.cyan, width: 2.0)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.cyan),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.fromLTRB(30, 20, 30, 20)),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontSize: 14, color: Colors.white))),
                        onPressed: () async {},
                        child: Column(
                          children: const [
                            Icon(Icons.image_outlined),
                            Text(
                              'Submit',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.cyan),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.fromLTRB(30, 20, 30, 20)),
                            textStyle: MaterialStateProperty.all(
                                const TextStyle(
                                    fontSize: 14, color: Colors.white))),
                        onPressed: () async {},
                        child: Column(
                          children: const [
                            Icon(Icons.image_outlined),
                            Text(
                              'Cancel',
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
