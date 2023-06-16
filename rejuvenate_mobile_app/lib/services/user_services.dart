import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rejuvenate_mobile_app/screens/patientreport.dart';

import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../utils/constants.dart';
import '../utils/error_message.dart';
import '../widgets/loading_widget.dart';
import '../utils/constants.dart' as val;

import 'package:firebase_storage/firebase_storage.dart';

class UserService {
  Future signUp(
      WidgetRef ref,
      BuildContext context,
      TextEditingController fnameController,
      TextEditingController lnameController,
      TextEditingController phoneController,
      TextEditingController genderController,
      DateTime birthController,
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController specialtyController) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return const Center(
              child: LoadingWidget(),
            );
          });
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.of(context).pushNamed('/verifyemail', arguments: {
        "fname": fnameController.text,
        "lname": lnameController.text,
        "phone": phoneController.text,
        "gender": genderController.text,
        "birth": birthController,
        "specialty": specialtyController.text,
      });
      // });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Navigator.of(context).pop();
        error("Error!", "The password provided is too weak.");
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(val.snackBar);
      } else if (e.code == 'email-already-in-use') {
        Navigator.of(context).pop();
        error("Error!", "The account already exists for that email.");
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(val.snackBar);
      }
    } catch (e) {
      print(e);
    }
  }

  Future signUppatient(
      WidgetRef ref,
      BuildContext context,
      TextEditingController fnameController,
      TextEditingController lnameController,
      TextEditingController phoneController,
      TextEditingController genderController,
      DateTime birthController,
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController patientproblemController) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return const Center(
              child: LoadingWidget(),
            );
          });
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      String id = (ref.read(newUserDataProivder.notifier).state!.ID);
      await UserService.saveUserpatient(
          id,
          fnameController.text,
          lnameController.text,
          phoneController.text,
          genderController.text,
          birthController,
          patientproblemController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Navigator.of(context).pop();
        error("Error!", "The password provided is too weak.");
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(val.snackBar);
      } else if (e.code == 'email-already-in-use') {
        Navigator.of(context).pop();
        error("Error!", "The account already exists for that email.");
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(val.snackBar);
      }
    } catch (e) {
      print(e);
    }
  }

  Future signIn(
      WidgetRef ref,
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return const Center(
              child: LoadingWidget(),
            );
          });

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        UserService().getNewUserData().then((value) {
          String Id = value[1];
          dynamic data = value[0];
          UserModel user = UserModel.fromSnapshot(data, Id);
          ref.read(newUserDataProivder.notifier).state = user;
          loggedin = true;
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        });
      } else {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushNamed('/verifyemail');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.of(context).pop();
        error("Error!", "No user found for that email.");
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(val.snackBar);
      } else if (e.code == 'wrong-password') {
        Navigator.of(context).pop();
        error("Error!", "Wrong password provided for that user.");
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(val.snackBar);
      }
    }
  }

  Future<List> getNewUserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    String id = user.uid;
    return [
      await FirebaseFirestore.instance.collection('users').doc(id).get(),
      id
    ];
  }

  static saveUser(String fname, String lname, String phone, String gender,
      DateTime birth, String specialty) async {
    //Dont Put Instance common as it doesnt change when the user logs out
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;

    // // Get the default image from the app's assets folder
    // final byteData = await rootBundle.load('assets/Profile.png');
    // final tempDir = await getTemporaryDirectory();
    // final file = File('${tempDir.path}/Profile.png');
    // await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    //  // Upload the image to Firebase Storage
    // final Reference ref = FirebaseStorage.instance.ref().child('${tempDir.path}/Profile.png');
    // final UploadTask uploadTask = ref.putFile(file);
    // final TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);

    // // Get the download URL of the image
    // final String downloadUrl = await snapshot.ref.getDownloadURL();
    final image = Image.file(
      File('assets/Profile.png'),
    );

    final ref = FirebaseStorage.instance
        .ref()
        .child('profilepic')
        .child('${user.uid}.png');

    // final file = File(image); 
    final f = File('assets/Profile.png');
    await ref.putFile(f).whenComplete(() {});

    final url = await ref.getDownloadURL();

    Map<String, dynamic> userData = {
      "email": user.email,
      "fname": fname,
      "lname": lname,
      "phone": phone,
      "gender": gender,
      "birth": birth,
      "profilepic": url,
      "role": "user",
    };

    Map<String, dynamic> doctorData = {
      "specialty": specialty,
      "listofpatients": [],
      "user_id": user.uid
    };
    final userRef = db.collection("users").doc(user.uid);
    final doctorRef = db.collection("doctors").doc(user.uid);
    if ((await userRef.get()).exists && (await doctorRef.get()).exists) {
      // To Update Anything in the User
    } else {
      await userRef.set(userData);
      await doctorRef.set(doctorData);
    }
  }

  static saveUserpatient(String id, String fname, String lname, String phone,
      String gender, DateTime birth, String problemtype) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;

    Map<String, dynamic> userData = {
      "email": user.email,
      "fname": fname,
      "lname": lname,
      "phone": phone,
      "gender": gender,
      "birth": birth,
      "problemtype": problemtype,
      "role": "user",
    };

    Map<String, dynamic> doctorData = {
      "listofpatients": [],
    };
    final userRef = db.collection("users").doc();
    final doctorRef = db.collection("doctors").doc(id);
    final patientid = await userRef.get().then((value) => value.reference.id);
    final patientRef = db.collection("patient").doc(patientid);

    final listofpatients =
        await doctorRef.get().then((value) => value.data()!["listofpatients"]);
    listofpatients.add(patientid);
    doctorData['listofpatients'] = listofpatients;
    print(id);
    await userRef.set(userData);
    await doctorRef.update(doctorData);
    await patientRef.set({"patientreportid": ""});
  }
/////////////////////////////////////
//  Future PatientReport(

//       BuildContext context,
//       TextEditingController _nameController,
//       TextEditingController _problemController) async {
//         final user = FirebaseAuth.instance.currentUser!;
//     String id = user.uid;
//     return [
//       await FirebaseFirestore.instance.collection('patient').doc(id).get(),
//       id
//     ];
//       }
  saveUserpatientreport(
      String nameController,
      String genderTypeEnum,
      String answerTypeEnum,
      String selectedVal,
      String problemController) async {
    //Dont Put Instance common as it doesnt change when the user logs out
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;

    Map<String, dynamic> userData = {
      "name": nameController,
      "gender": genderTypeEnum,
      "answertype": answerTypeEnum,
      "problemm": problemController,
      "select": selectedVal,
    };

    // Map<String, dynamic> doctorData = {
    //   "listofpatients": [],
    //   "user_id": user.uid,

    // };

    // // final userRef = db.collection("users").doc(user.uid);
    // final doctorRef = db.collection("doctors").doc(user.uid);
    final patientRef = db.collection("patientreport").doc(user.uid);
    // final patientid = await patientRef.get().then((value) => value.reference.id);
    if ((await patientRef.get()).exists && (await patientRef.get()).exists) {
      // To Update Anything in the User
    } else {
      await patientRef.set(userData);
    }

    // await userRef.set(userData);
    // await doctorRef.update(doctorData);
    // await patientRef.set({"patientreportid": ""});
  }

  static signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    loggedin = false;

    Navigator.of(context).pushReplacementNamed('/login');
  }

  resetPassword(
      BuildContext context, TextEditingController emailController) async {
    try {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return const Center(
              child: LoadingWidget(),
            );
          });
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      error("Important", "Password Reset Email Sent");
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    } on FirebaseAuthException catch (e) {
      print(e);
      error("Error!", e.message.toString());
      Navigator.of(context).pop();
    }
  }
}
