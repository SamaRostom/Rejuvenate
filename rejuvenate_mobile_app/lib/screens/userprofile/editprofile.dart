import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/validations.dart';

class EditProfile extends ConsumerStatefulWidget {
  const EditProfile({super.key});
  @override
  ConsumerState<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfile> {
  bool passwordVisible = false;
  final userCollection = FirebaseFirestore.instance.collection("users");
  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  // final passwordcontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(newUserDataProivder);
    if (counter++ == 0) {
      firstnamecontroller.text = userData!.fname;
      lastnamecontroller.text = userData.lname;
      emailcontroller.text = userData.email;
      phonenumbercontroller.text = userData.phone;
    }
    print(userData!.ID);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: const Color.fromARGB(255, 1, 6, 29),
        shadowColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              'Edit Profile',
              style: GoogleFonts.nunitoSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: const Color.fromARGB(255, 1, 6, 29)),
            ),
          ),
          const SizedBox(
            height: 60,
          ),
// First Name
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 0),
            child: TextFormField(
              obscureText: false,
              decoration: CommonStyle.textFieldStyle3(
                  labelText: ("First name"),
                  // labelText: (ref.watch(newUserDataProivder)!.fname),
                  prefixIcon: const Icon(Icons.person_outlined)),
              controller: firstnamecontroller,
              validator: (value) {
                if (!value!.isNotEmpty && !value.isValidName) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 0),
            child: TextFormField(
              obscureText: false,
              decoration: CommonStyle.textFieldStyle3(
                  labelText: ("Last name"),
                  // labelText: (ref.watch(newUserDataProivder)!.lname),
                  prefixIcon: const Icon(Icons.person_outlined)),
              controller: lastnamecontroller,
              validator: (value) {
                if (!value!.isNotEmpty && !value.isValidName) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),
          ),

//E-mail

          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 0),
            child: TextFormField(
              obscureText: false,
              decoration: CommonStyle.textFieldStyle3(
                  labelText: ("Email"),
                  // labelText: (ref.watch(newUserDataProivder)!.email),
                  prefixIcon: const Icon(Icons.email_outlined)),
              controller: emailcontroller,
              validator: (value) {
                if (!value!.isValidEmail) {
                  return 'Enter valid email';
                }
                if (value[value.length - 1] == '.') {
                  return 'Enter valid email';
                }
                return null;
              },
            ),
          ),

//Phone Number
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 0),
            child: TextFormField(
              obscureText: false,
              decoration: CommonStyle.textFieldStyle3(
                  labelText: ("Phone number"),
                  // labelText: (ref.watch(newUserDataProivder)!.gender),
                  prefixIcon: const Icon(Icons.phone_outlined)),
              controller: phonenumbercontroller,
              validator: (value) {
                if (!value!.isNotEmpty && !value.isValidPhone) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),
          ),

          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                onPressed: () {
                  if (firstnamecontroller.text != userData.fname ||
                      lastnamecontroller.text != userData.lname ||
                      emailcontroller.text != userData.email ||
                      phonenumbercontroller.text != userData.phone) {
                    //update database
                    userCollection.doc(userData.ID).update({
                      "fname": firstnamecontroller.text,
                      "lname": lastnamecontroller.text,
                      "email": emailcontroller.text,
                      "phone": phonenumbercontroller.text
                    }).then((value) {
                      userData.fname = firstnamecontroller.text;
                      userData.lname = lastnamecontroller.text;
                      userData.email = emailcontroller.text;
                      userData.phone = phonenumbercontroller.text;
                      ref.read(newUserDataProivder.notifier).state = userData;
                      Navigator.pushNamed(context, '/savingprofileupdates');
                    });
                  } else if (firstnamecontroller.text.isEmpty ||
                      lastnamecontroller.text.isEmpty ||
                      emailcontroller.text.isEmpty ||
                      phonenumbercontroller.text.isEmpty) {
                    print("Please enter all fields");
                  }
                },
                child: const Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
      // ),
    );
  }
}
