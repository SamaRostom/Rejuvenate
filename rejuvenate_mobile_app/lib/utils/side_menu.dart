import 'package:flutter/material.dart';
import 'package:rejuvenate_mobile_app/services/user_services.dart';
import 'package:ternav_icons/ternav_icons.dart';

class SideMenu1 extends StatelessWidget {
  const SideMenu1({
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
            height: 150,
            child: DrawerHeader(
                child: Image.asset(
              'assets/Logo.jpg',
            )),
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
              Navigator.of(context).pushNamed('/profile');
            },
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.folder,
            title: "Choose problem",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.chat,
            title: "Message",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.menu,
            title: "Dashboard",
            onTap: () {
              Navigator.of(context).pushNamed('/dashboard');
            },
          ),
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
            height: 150,
            child: DrawerHeader(
                child: Image.asset(
              'assets/Logo.jpg',
            )),
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
              Navigator.of(context).pushNamed('/profile');
            },
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.folder,
            title: "Choose problem",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.chat,
            title: "Message",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.menu,
            title: "Dashboard",
            onTap: () {
              Navigator.of(context).pushNamed('/dashboard');
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
        color: Colors.cyan,
        size: 25,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.grey, fontSize: 20),
      ),
    );
  }
}

