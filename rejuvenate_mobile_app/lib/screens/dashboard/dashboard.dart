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
           backgroundColor: Colors.transparent,
          elevation: 0.0,
          foregroundColor: const Color.fromARGB(255, 1, 6, 29),
          shadowColor: Colors.white,
          bottom: TabBar(
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                  icon: const Icon(
                    Icons.dashboard_outlined,
                    color: Color.fromRGBO(13, 71, 161, 1),
                  ),
                  child: Text('Dashboard',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 20, color: Colors.blue[900]))),
              Tab(
                  icon: const Icon(Icons.history_edu_outlined,
                      color: Color.fromRGBO(13, 71, 161, 1)),
                  child: Text('History',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 20, color: Colors.blue[900]))),
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
