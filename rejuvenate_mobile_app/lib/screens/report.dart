import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import '../utils/constants.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  List answers = [
    {"answers":["Type 1", "Type 2", "Gestational", "Pre-diabetes", "None"], "type":"One"},
    {"answers":["Yes", "No"], "type":"One"},
    {"answers":["abnormal ECG", "previous heart attack", "None"], "type":"One"},
    {"answers":["vitamins", "herbal supplements", "alcohol", "tobacco", "drugs"], "type":"Multiple"},
    {"answers":["Skin", "Medications", "Food", "Other", "None"], "type":"Multiple"},
    {"answers":["Diabetes", "Hypertension", "Heart Disease", "None"], "type":"Multiple"},
    {"answers":[], "type":"text"},
  ];
  List visibility = [true, false, false, false, false, false, false];
  List<List> selectedAnswers = [[], [], [], [], [], [], []];
  int currentquestion = 0;
  TextEditingController textController = TextEditingController();
  BoxDecoration active = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: const Color.fromARGB(50, 105, 137, 242),
    border: Border.all(
      color: const Color(0xFF6989F2),
      width: 2,
    ),
  );
  BoxDecoration inactive = BoxDecoration(
     borderRadius:BorderRadius.circular(15),
     color: Colors.grey[200],
  );
  // late BoxDecoration current = inactive;                                                
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: const Color(0xFF2C49A7),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:30.0, right: 30.0, top: 30.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  color: Colors.white,
                ),
                // padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 15.0, right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Patient Report",
                            style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(7.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(94, 218, 218, 218),
                              ),
                              child: const Icon(Icons.close, color: Color.fromARGB(255, 158, 158, 158),),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Progress", style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),),
                          Text("${currentquestion+1} of 7", style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),)
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
                      child: LinearProgressIndicator(
                        value: (currentquestion + 1) / questions.length,
                        backgroundColor: Colors.grey[200],
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 105, 137, 242)),
                      ),
                    ),
                    Stack(
                      children: [
                        for (int i = 0; i < questions.length; i++)
                          Visibility(
                            visible: visibility[i],
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15.0),
                              child: Column(
                                children: [
                                  Text(
                                    questions[i],
                                    style: GoogleFonts.poppins(
                                      fontSize: 22,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // Text(answers[i].toString()),
                                  if(answers[i]["type"] != "text")
                                  for (int j = 0; j < answers[i]["answers"].length; j += 2)
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            for (int k = 0;k <=((j + 1 < answers[i]["answers"].length)? 1: 0);k++)
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if(answers[i]["type"] == "One"){
                                                      selectedAnswers[i].clear();
                                                      selectedAnswers[i].add(answers[i]["answers"][k + j].toString());
                                                    }
                                                    else if(answers[i]["type"] == "Multiple"){
                                                      if(selectedAnswers[i].contains(answers[i]["answers"][k + j].toString())){
                                                        selectedAnswers[i].remove(answers[i]["answers"][k + j].toString());
                                                      }
                                                      else{
                                                        selectedAnswers[i].add(answers[i]["answers"][k + j].toString());
                                                      }
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  decoration: selectedAnswers[i].contains(answers[i]["answers"][k + j].toString())? active: inactive,
                                                  height: 90,
                                                  width: 130,
                                                  child: Center(
                                                    child: Text(
                                                        answers[i]["answers"][k + j].toString(), textAlign: TextAlign.center,),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    ),
                                  if(answers[i]["type"] == "text") 
                                    Column(
                                    children: [  
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: TextField(
                                        maxLines: null,
                                        expands: true,
                                        keyboardType: TextInputType.multiline,
                                        textAlign: TextAlign.start,
                                        controller: textController,
                                        decoration: InputDecoration(
                                          hintText: "Enter your answer here",
                                          hintStyle: GoogleFonts.poppins(
                                            fontSize: 15,
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                      ),
                                    ),
                                    ],
                                    ),
                                ],
                              ),
                            ),
                          )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (currentquestion-1 >= 0){
                          currentquestion--;
                          for (int i = 0; i < visibility.length; i++) {
                            visibility[i] = false;
                          }
                          visibility[currentquestion] = true;
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 30, 56, 141),
                      ),
                      child: 
                      const Padding(
                        padding: EdgeInsets.only(left:7.0),
                        child: Icon(Icons.arrow_back_ios, color: Colors.white,),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (currentquestion == questions.length - 1) {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const Report()));
                          print(selectedAnswers);

                        }
                        if (currentquestion+1 < visibility.length){
                          currentquestion++;
                          for (int i = 0; i < visibility.length; i++) {
                            visibility[i] = false;
                          }
                          visibility[currentquestion] = true;
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(13.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(143, 105, 137, 242),
                      ),
                      child: 
                      Padding(
                        padding: const EdgeInsets.only(left:7.0),
                        child: Row(
                          children: [
                            Text("Next question  ", style: GoogleFonts.poppins(color: Colors.white, fontSize: 18),),
                            const Icon(Icons.arrow_forward_outlined, color: Colors.white,size: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
