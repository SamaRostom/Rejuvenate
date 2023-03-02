import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rejuvenate_mobile_app/screens/dashboard/dashboard.dart';
import 'package:rejuvenate_mobile_app/screens/home.dart';
import 'package:rejuvenate_mobile_app/screens/input_image/preview_page.dart';

import 'screens/choosingproblem.dart';
import 'screens/editprofile.dart';
import 'screens/finalresult.dart';
import 'screens/login_signup/forget_password.dart';
import 'screens/login_signup/login.dart';
import 'screens/login_signup/verify_email.dart';
import 'screens/patientreport.dart';
import 'screens/savingprofileupdates.dart';
import 'screens/login_signup/signup.dart';
import 'screens/input_image/uploadimage.dart';
import 'screens/viewprofile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
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
      initialRoute: '/patientreport',
      routes: {
        '/': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/forgetpassword': (context) => const ForgetPassword(),
        '/verifyemail': (context) => const VerifyEmail(),
        '/dashboard': (context) => const Dashboard(),
        '/editprofile': (context) => const EditProfile(),
        '/viewprofile': (context) => const ViewProfile(),
        '/finalresult': (context) => const FinalResult(),
        '/patientreport': (context) => const PatientReport(),
        '/uploadimage': (context) => const UploadImage(),
        '/savingprofileupdates': (context) => const SavingProfileUpdates(),
        '/choosingproblem': (context) => const ChoosingProblem(),
        // '/PreviewPage': (context) => const PreviewPage(),
        
      },
    );
  }
}
