import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/user_provider.dart';
import '../utils/constants.dart';
import '../utils/side_menu.dart';

class ViewProfile extends ConsumerStatefulWidget {
  const ViewProfile({super.key});
  @override
  ConsumerState<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends ConsumerState<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: loggedin == true ? const SideMenu1() : const SideMenu2(),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 40.0),
          child: Center(
              child: Text('Your Account',
                  style: GoogleFonts.notoSansAdlam(fontSize: 35))),
        ),
        toolbarHeight: 80,
        backgroundColor: Colors.cyan,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Stack(
                children: [
                  SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/Profile.png',
                            fit: BoxFit.cover),
                      )),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(Icons.person),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: Text(
                      ref.watch(newUserDataProivder)!.fname,
                      style: GoogleFonts.lato(
                        fontSize: 25,
                        color: const Color.fromARGB(255, 23, 75, 82),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    ref.watch(newUserDataProivder)!.lname,
                    style: GoogleFonts.lato(
                      fontSize: 25,
                      color: const Color.fromARGB(255, 23, 75, 82),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black38,
              ),
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(Icons.email),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Text(
                      ref.watch(newUserDataProivder)!.email,
                      style: GoogleFonts.lato(
                        fontSize: 25,
                        color: const Color.fromARGB(255, 23, 75, 82),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.black38,
              ),
              Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Icon(Icons.phone),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Text(
                      ref.watch(newUserDataProivder)!.gender,
                      style: GoogleFonts.lato(
                        fontSize: 25,
                        color: const Color.fromARGB(255, 23, 75, 82),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
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
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.cyan,
      //   onPressed: () => Navigator.of(context).pushNamed('/editprofile'),
      //   // tooltip: 'Increment',
      //   child: const Icon(
      //     Icons.edit,
      //   ),
      // ),
    );
  }
}
