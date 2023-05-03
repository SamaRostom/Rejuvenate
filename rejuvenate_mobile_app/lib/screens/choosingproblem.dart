import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/user_provider.dart';
import '../utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/side_menu.dart';

class ChoosingProblem extends ConsumerStatefulWidget {
  static const routeName = "/choosingproblem-screen";

  const ChoosingProblem({super.key});
  @override
  ConsumerState<ChoosingProblem> createState() => _ChoosingProblemState();
}

class _ChoosingProblemState extends ConsumerState<ChoosingProblem> {
  _ChoosingProblemState() {
    _selectedVal = _problemList[0];
  }

  final _problemList = ["Cleft Lip"];
  String? _selectedVal = "Choose a problem";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          foregroundColor: const Color.fromARGB(255, 1, 6, 29),
          shadowColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(left: 280.0),
            child: IconButton(
              icon: const Icon(
                Icons.person_outline_rounded,
                color: Colors.blue,
              ),
              color: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, '/viewprofile');
              },
            ),
          ),
        ),
        drawer: loggedin == true ? const SideMenu1() : const SideMenu2(),
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 220, //height of button
              width: 500, //width of button
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 90.0, bottom: 20.0),
                    child: Text(
                      ' Welcome, \n ${ref.watch(newUserDataProivder)!.fname}',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 25,
                          color: const Color.fromARGB(255, 1, 6, 29)),
                    ),
                  ),
                  SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200),
                        child:
                            Image.asset('assets/Doctor.png', fit: BoxFit.cover),
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Choosing problem of patient',
                  style: GoogleFonts.nunitoSans(
                      fontSize: 30, color: const Color.fromARGB(255, 1, 6, 29)),
                ),
              ],
            ),
            const SizedBox(
              height: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: DropdownButtonFormField(
                value: _selectedVal,
                items: _problemList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    _selectedVal = val;
                  });
                },
                icon: const Icon(
                  Icons.arrow_drop_down_circle,
                  color: Colors.blueAccent,
                ),
                decoration: const InputDecoration(
                  labelText: "Problems",
                ),
              ),
            ),
            const SizedBox(
              height: 70.0,
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
                    Navigator.pushNamed(context, '/inpaint');
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
