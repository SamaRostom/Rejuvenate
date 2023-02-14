import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejuvenate_mobile_app/screens/dashboard/dashboard_detail.dart';
import 'package:rejuvenate_mobile_app/screens/dashboard/history.dart';

import '../../config/size_config.dart';
import '../../utils/constants.dart';
import '../../utils/side_menu.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: loggedin == true ? const SideMenu1(): const SideMenu2(),
        appBar: AppBar(
            title: Center(
                child: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child:
                  Text('Dashboard', style: GoogleFonts.notoSansAdlam(fontSize: 40)),
            )),
            toolbarHeight: 80,
            backgroundColor: Colors.cyan,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            bottom: TabBar(
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(icon: const Icon(Icons.dashboard_outlined),child: Text('Dashboard', style: GoogleFonts.notoSansAdlam(fontSize: 20))),
                Tab(icon: const Icon(Icons.history_edu_outlined),child: Text('History', style: GoogleFonts.notoSansAdlam(fontSize: 20))),
              ],
            ), 
          ),
        body: const TabBarView(
          children: [
            DashboardDetail(),
            History(),
          ],
        ),
      ),
    );
  }
}
