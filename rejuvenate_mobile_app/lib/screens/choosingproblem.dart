import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import '../utils/constants.dart';
import '../utils/side_menu.dart';

class ChoosingProblem extends StatefulWidget {
  static const routeName = "/choosingproblem-screen";

  const ChoosingProblem({super.key});
  @override
  State<ChoosingProblem> createState() => _ChoosingProblemState();
}

class _ChoosingProblemState extends State<ChoosingProblem> {
  // _ChoosingProblemState() {
  //   _selectedVal = _problemList[0];
  // }

  // final _problemList = ["Cleft Lip", "Burn", "Bow"];
  // String? _selectedVal = "Choose a problem";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.cyan),
        drawer: loggedin == true ? const SideMenu1() : const SideMenu2(),
        body: Column(
          children: [
            Container(
              height: 220, //height of button
              width: 500, //width of button
              color: Colors.cyan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // const SizedBox(
                  //   height: 50,
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100.0, bottom: 20.0),
                    child: Text(
                      'Hello,\n Dr Reema',
                      style: GoogleFonts.patrickHand(
                          fontSize: 30, color: Colors.white),
                    ),
                  ),

                  SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child: Image.asset('assets/Final1Test.jpg',
                            fit: BoxFit.cover),
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 255, 255, 255),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/viewprofile');
                    },
                    child: const Text(
                      'Your Profile',
                      style: TextStyle(color: Colors.cyan, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Choosing problem of patient',
                  style: GoogleFonts.kanit(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 0, 185, 209)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
