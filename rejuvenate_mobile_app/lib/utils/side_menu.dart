import 'package:flutter/material.dart';
import 'package:rejuvenate_mobile_app/services/user_services.dart';
import 'package:ternav_icons/ternav_icons.dart';
import 'package:flutter/cupertino.dart'; // Import Cupertino library for CupertinoSwitch

class SideMenu1 extends StatefulWidget {
  const SideMenu1({
    Key? key,
  }) : super(key: key);

  @override
  _SideMenu1State createState() => _SideMenu1State();
}

class _SideMenu1State extends State<SideMenu1> {
  bool switchTheme = false; // Add a boolean variable to track the state of the switch
  bool switchlang = false; // Add a boolean variable to track the state of the switch

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width / 1.5,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 170,
            child: DrawerHeader(
              child: Image.asset(
                'assets/Logo.png',
              ),
            ),
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.home_2,
            title: "Home",
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.profile,
            title: "Profile",
            onTap: () {
              Navigator.of(context).pushNamed('/viewprofile');
            },
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.document,
            title: "Patient Report",
            onTap: () {
              Navigator.of(context).pushNamed('/report');
            },
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.folder,
            title: "Choose problem",
            onTap: () {
              Navigator.of(context).pushNamed('/choosingproblem');
            },
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.menu,
            title: "Dashboard",
            onTap: () {
              Navigator.of(context).pushNamed('/dashboard');
            },
          ),
          // ListTile(
          //   leading: Icon(
          //     TernavIcons.lightOutline.night,
          //     color: const Color(0xFF2C49A7),
          //     size: 25,
          //   ),
          //   title: const Text(
          //     "Dark theme",
          //     style: TextStyle(
          //       color: Color.fromARGB(255, 1, 6, 29),
          //       fontSize: 20,
          //     ),
          //   ),
          //   trailing: CupertinoSwitch(
          //     activeColor: const Color(0xFF2C49A7), 
          //     thumbColor: Colors.white,
          //     trackColor: Colors.black12,
          //     value: switchTheme,
          //     onChanged: (value) => setState(() => switchTheme = value),
          //   ),
          //   onTap: () {
          //     // Add your dark theme logic here
          //   },
          // ),
          // ListTile(
          //   leading: const Icon(
          //     IconData(0xe67b, fontFamily: 'MaterialIcons'),
          //     color: Color(0xFF2C49A7),
          //     size: 25,
          //   ),
          //   title: const Text(
          //     "English",
          //     style: TextStyle(
          //       color: Color.fromARGB(255, 1, 6, 29),
          //       fontSize: 20,
          //     ),
          //   ),
          //   trailing: CupertinoSwitch(
          //     activeColor: const Color(0xFF2C49A7), 
          //     thumbColor: Colors.white,
          //     trackColor: Colors.black12,
          //     value: switchlang,
          //     onChanged: (value) => setState(() => switchlang = value),
          //   ),
          //   onTap: () {
          //     // Add your language selection logic here
          //   },
          // ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.logout,
            title: "Log out",
            onTap: () {
              UserService.signOut(context);
            },
          ),
        ],
      ),
    );
  }
}

class SideMenu2 extends StatelessWidget {
  const SideMenu2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width / 1.5,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 170,
            child: DrawerHeader(
              child: Image.asset(
                'assets/Logo.png',
              ),
            ),
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.home_2,
            title: "Home",
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.arrow_right_1,
            title: "Sign up",
            onTap: () {
              Navigator.of(context).pushNamed('/signup');
            },
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.login,
            title: "Log in",
            onTap: () {
              Navigator.of(context).pushNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: const Color(0xFF2C49A7),
        size: 25,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color.fromARGB(255, 1, 6, 29),
          fontSize: 20,
        ),
      ),
    );
  }
}
