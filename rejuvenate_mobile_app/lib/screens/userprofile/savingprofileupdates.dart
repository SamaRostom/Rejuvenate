import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SavingProfileUpdates extends StatefulWidget {
  const SavingProfileUpdates({super.key});
  @override
  State<SavingProfileUpdates> createState() => _SavingProfileUpdatesState();
}

class _SavingProfileUpdatesState extends State<SavingProfileUpdates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Lottie.asset('assets/checkdone.json'),
              Text(
                "\tProfile Updated\n\t\t\t\t\tSuccefully",
                style: GoogleFonts.robotoSlab(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900]),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 15, right: 15, bottom: 0),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/viewprofile'),
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Colors.black.withOpacity(0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Return',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
