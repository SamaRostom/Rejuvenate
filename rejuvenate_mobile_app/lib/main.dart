import 'package:flutter/material.dart';
import 'screens/editprofile.dart';
import 'screens/finalresult.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/savingprofileupdates.dart';
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
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/login',
      // initialRoute: '/finalresult',

      routes: {
        '/login':(context) => const LoginScreen(),
        '/signup':(context) => const SignupScreen(),
        '/editprofile': (context) => const EditProfile(),
        '/viewprofile': (context) => const ViewProfile(),
        '/finalresult': (context) => const FinalResult(),
        '/patientreport': (context) => const PatientReport(),
        '/savingprofileupdates': (context) => const SavingProfileUpdates(),
      },
    );
  }
}
