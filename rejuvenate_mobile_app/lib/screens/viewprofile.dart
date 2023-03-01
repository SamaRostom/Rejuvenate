import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/side_menu.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({super.key});
  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: loggedin == true ? const SideMenu1() : const SideMenu2(),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
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
                        child: Image.asset('assets/viewprofileTest.jpg',
                            fit: BoxFit.cover),
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.cyan),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Salma Salah",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 28, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () => Navigator.of(context).pushNamed('/editprofile'),
        // tooltip: 'Increment',
        child: const Icon(
          Icons.edit,
        ),
      ),
    );
  }
}
