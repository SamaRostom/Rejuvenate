import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rejuvenate_mobile_app/services/user_services.dart';
import '../providers/user_provider.dart';
import '../utils/constants.dart';
import 'report.dart';

class PatientProfile extends ConsumerStatefulWidget {
  const PatientProfile({super.key});

  @override
  ConsumerState<PatientProfile> createState() => _PatientProfileState();
}

class _PatientProfileState extends ConsumerState<PatientProfile> {
  @override
  Widget build(BuildContext context){
    final patientdata = ref.watch(patientDataProivder.notifier).state;
    final answers = ref.watch(selectedAnswersProvider);
    final items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF2C49A7),
      body: SafeArea(
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                // color: Colors.red,
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
            ),
            CircleAvatar(
              radius: 45,
              child: ClipOval(child:Image.asset('assets/Profile.png')),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  patientdata!["fname"] + " " + patientdata["lname"],
                  style: GoogleFonts.poppins(
                      fontSize: 25,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      wordSpacing: 2,
                      letterSpacing: 2),
                ),
                Text(
                  "Cleft Lip",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                         decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF6989F2),
                      ),
                        padding: const EdgeInsets.all(16),
                        child: SvgPicture.asset(
                                    'assets/mobile.svg',
                                    semanticsLabel: 'Acme Logo',
                                    width: 28.0,
                                    height: 28.0,
                                  ),
                      ),
                      Container(
                         decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF6989F2),
                      ),
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(
                                    'assets/email.svg',
                                    semanticsLabel: 'Acme Logo',
                                    width: 19.0,
                                    height: 19.0,
                                  ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 25),
                      child: Text(
                        "Results",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(left: 15.0),
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xFFD9D9D9),
                              ),
                              height: 120,
                              width: 150,
                              child: Image.asset(
                        "assets/baby2.png",
                        fit: BoxFit.cover,
                      ),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 20, right: 25, left: 25),
                          child: Text(
                            "Report",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 200, top: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFF6989F2),
                            ),
                            height: 40,
                            width: 40,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const ReportScreen()),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: SvgPicture.asset(
                                    'assets/arrowright2.svg',
                                    semanticsLabel: 'Acme Logo',
                                    width: 23.0,
                                    height: 23.0,
                                  ),
                                  ),
                                ),
                                // Add additional widgets to the row as needed
                              ],
                            ),
                          ),
                        ),
                        // const SizedBox(
                        //   width: 10,
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 20),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(15),
                        //       color: const Color(0xFF6989F2),
                        //     ),
                        //     height: 40,
                        //     width: 40,
                        //     child: Row(
                        //       children: [
                        //         Container(
                        //           padding: const EdgeInsets.only(left: 10),
                        //           child: SvgPicture.asset(
                        //           'assets/Vector (1).svg',
                        //           semanticsLabel: 'Acme Logo',
                        //           width: 23.0,
                        //           height: 23.0,
                        //         ),
                        //         ),
                        //         // Add additional widgets to the row as needed
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                      future: UserService.loadAnswersFromFirestore(ref),
                      builder: (context, snapshot) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                          
                        for (int i = 0; i < questions.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom:20.0),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xFF6989F2)),
                            width: 380,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  questions[i],
                                  // textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: const Color.fromARGB(255, 255, 250, 250),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromARGB(85, 255, 255, 255),
                                  ),
                                  width: 360,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:15.0, top: 10, bottom: 10),
                                    child: 
                                    answers != null ? Text(
                                      answers[i].toString(),
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color:
                                            const Color.fromARGB(255, 234, 231, 231),
                                      ),
                                    ) : Text(
                                      "No answer",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color:
                                            const Color.fromARGB(255, 234, 231, 231),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                         ],);
                      }
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}