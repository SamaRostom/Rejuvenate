import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/user_provider.dart';
import '../../utils/constants.dart';
import '../../utils/side_menu.dart';

class ViewProfile extends ConsumerStatefulWidget {
  const ViewProfile({super.key});
  @override
  ConsumerState<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends ConsumerState<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: loggedin == true ? const SideMenu1() : const SideMenu2(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: const Color.fromARGB(255, 1, 6, 29),
        shadowColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                      width: 200,
                      height: 200,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/Profile.png',
                            fit: BoxFit.cover),
                      )),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.people,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: Text(
                      ref.watch(newUserDataProivder)!.fname,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 1, 6, 29),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    ref.watch(newUserDataProivder)!.lname,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 1, 6, 29),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Color.fromARGB(96, 255, 255, 255),
              ),
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.email,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Text(
                      ref.watch(newUserDataProivder)!.email,
                      style: GoogleFonts.nunitoSans(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 1, 6, 29)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Color.fromARGB(96, 255, 255, 255),
              ),
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.phone,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Text(
                      ref.watch(newUserDataProivder)!.phone,
                      style: GoogleFonts.nunitoSans(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 1, 6, 29)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Color.fromARGB(96, 255, 255, 255),
              ),
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(
                      Icons.female,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Text(
                      ref.watch(newUserDataProivder)!.gender,
                      style: GoogleFonts.nunitoSans(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 1, 6, 29)),
                    ),
                  ),
                ],
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
                      Navigator.pushNamed(context, '/editprofile');
                    },
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
