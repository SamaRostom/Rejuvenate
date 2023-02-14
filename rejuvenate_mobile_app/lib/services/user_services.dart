import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';
import '../providers/user_provider.dart';
import '../utils/constants.dart';
import '../utils/error_message.dart';
import '../widgets/loading_widget.dart';
import '../utils/constants.dart' as val;

class UserService {
  Future signUp(WidgetRef ref, BuildContext context, TextEditingController fnameController, TextEditingController lnameController, TextEditingController phoneController, TextEditingController genderController, DateTime birthController, TextEditingController emailController,
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
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        // UserService.saveUser(fnameController.text, lnameController.text, phoneController.text, genderController.text, birthController);
      // UserService().getNewUserData().then((value) {
      //   UserModel user = UserModel.fromSnapshot(value);
      //   ref.read(newUserDataProivder.notifier).state = user;
        Navigator.of(context).pushNamed('/verifyemail',arguments: {
          "fname": fnameController.text,
          "lname": lnameController.text,
          "phone": phoneController.text,
          "gender":  genderController.text,
          "birth": birthController,
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
          UserModel user = UserModel.fromSnapshot(value);
          ref.read(newUserDataProivder.notifier).state = user;
          loggedin = true;
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/dashboard', (route) => false);
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

  Future<DocumentSnapshot> getNewUserData() async {
    final user = FirebaseAuth.instance.currentUser!;
    String id = user.uid;
    return FirebaseFirestore.instance.collection('users').doc(id).get();
  }

  static saveUser(String fname,String lname, String phone, String gender, DateTime birth) async {
    //Dont Put Instance common as it doesnt change when the user logs out
    final FirebaseFirestore db = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser!;

    Map<String, dynamic> userData = {
      "email": user.email,
      "fname": fname,
      "lname": lname,
      "phone": phone,
      "gender": gender,
      "birth": birth,
      "role": "user",
    };
    final userRef = db.collection("users").doc(user.uid);
    if ((await userRef.get()).exists) {
      // To Update Anything in the User
    } else {
      await userRef.set(userData);
    }
  }


  static signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // preferences.setBool("remember", false);
    loggedin = false;
    Navigator.of(context).pushReplacementNamed('/login');
  }

  resetPassword(BuildContext context, TextEditingController emailController) async {
    try{
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return const Center(
              child: LoadingWidget(),
            );
          });
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      error("Important", "Password Reset Email Sent");
       Navigator.of(context)
              .pushNamedAndRemoveUntil('/viewprofile', (route) => false);
    } on FirebaseAuthException catch(e){
      print(e);
      error("Error!", e.message.toString());
       Navigator.of(context).pop();
        
    }
  }
}
