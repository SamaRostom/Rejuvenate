import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rejuvenate_mobile_app/screens/dashboard/dashboard.dart';
import 'package:rejuvenate_mobile_app/screens/home.dart';
import 'package:rejuvenate_mobile_app/screens/report.dart';
import 'screens/choosingproblem.dart';
import 'screens/dashboard/addpatient.dart';
import 'screens/dashboard/dashboard_detail.dart';
import 'screens/inpaint/finalresult.dart';
import 'screens/inpaint/inpaint.dart';
import 'screens/inpaint/uploadimage.dart';
import 'screens/login_signup/forget_password.dart';
import 'screens/login_signup/login.dart';
import 'screens/login_signup/verify_email.dart';
import 'screens/patientprofile.dart';
import 'screens/patientreport.dart';
import 'screens/login_signup/signup.dart';
import 'screens/splashscreen.dart';
import 'screens/userprofile/editprofile.dart';
import 'screens/userprofile/savingprofileupdates.dart';
import 'screens/userprofile/viewprofile.dart';

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
      initialRoute: '/splash',
      routes: {
        '/': (context) => const HomeScreen(),
        '/splash': (context) => const SplashScreen(),
        '/report': (context) => const ReportScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/forgetpassword': (context) => const ForgetPassword(),
        '/verifyemail': (context) => const VerifyEmail(),
        '/dashboard': (context) => const DashboardDetail(),
        '/editprofile': (context) => const EditProfile(),
        '/viewprofile': (context) => const ViewProfile(),
        '/patientprofile': (context) => const PatientProfile(),
        '/finalresult': (context) => const FinalResult(),
        '/patientreport': (context) => const PatientReport(),
        '/uploadimage': (context) => const UploadImage(),
        '/savingprofileupdates': (context) => const SavingProfileUpdates(),
        '/choosingproblem': (context) => const ChoosingProblem(),
        '/addpatient': (context) => const AddPatient(),
        '/inpaint': (context) => const InpaintPage(),
      },
    );
  }
}
