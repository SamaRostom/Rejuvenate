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

  final _problemList = ["Cleft Lip", "Burn", "Bow"];
  String? _selectedVal = "Choose a problem";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(left: 280.0),
              child: IconButton(
                icon: const Icon(Icons.person_outline_rounded),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/viewprofile');
                },
              ),
            ),
            backgroundColor: Colors.cyan),
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
                  Padding(
                    padding: const EdgeInsets.only(right: 90.0, bottom: 20.0),
                    child: Text(
                      // ' Hello,\n Dr. Reema',
                      ' Welcome \n  Dr. ${ref.watch(newUserDataProivder)!.fname}',

                      style:
                          GoogleFonts.lato(fontSize: 25, color: Colors.white),
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
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Choosing problem of patient',
                  style: GoogleFonts.lato(
                      fontSize: 30,
                      color: const Color.fromARGB(255, 0, 185, 209)),
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
                  color: Colors.cyan,
                ),
                decoration: InputDecoration(
                    labelText: "Problems",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        borderSide:
                            const BorderSide(color: Colors.cyan, width: 2.0))),
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
                      backgroundColor: const Color.fromARGB(246, 86, 203, 209),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: () {
                    Navigator.pushNamed(context, '/uploadimage');
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
