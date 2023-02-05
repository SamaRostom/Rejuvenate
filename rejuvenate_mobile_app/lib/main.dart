import 'package:flutter/material.dart';
// import '/screens/finalresult.dart';
import 'screens/editprofile.dart';
import 'screens/viewprofile.dart';
import 'screens/patientreport.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rejuvenate',
      theme: ThemeData(
        // primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Color.fromARGB(255, 250, 249, 246),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      // initialRoute: ViewProfile.routeName,
      initialRoute: PatientReport.routeName,
      routes: {
        EditProfile.routeName: (context) => const EditProfile(),
        ViewProfile.routeName: (context) => const ViewProfile(),
        // FinalResult.routeName: (context) => const FinalResult(),
        PatientReport.routeName: (context) => const PatientReport(),
      },
    );
  }
}
