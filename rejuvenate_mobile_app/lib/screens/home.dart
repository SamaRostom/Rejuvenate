import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejuvenate_mobile_app/screens/patientprofile.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../providers/user_provider.dart';
import '../services/history_service.dart';
import '../utils/constants.dart';
import '../utils/side_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dashboard/addpatient.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeName = "/home-screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    int _selectedIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/');
          break;
        case 1:
          Navigator.pushNamed(context, '/dashboard');
          break;
        case 2:
          Navigator.pushNamed(context, '/choosingproblem');
          break;
        case 3:
          Navigator.pushNamed(context, '/viewprofile');
          break;
      }
    }

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: loggedin == true ? const SideMenu1() : const SideMenu2(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? Stack(
                      children: const [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFF2C49A7),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          bottom: 0,
                          left: 0,
                          child: Icon(Icons.home_outlined),
                        ),
                      ],
                    )
                  : const Icon(Icons.home_outlined),
              label: '',
            ),
            // BottomNavigationBarItem(
            //   icon: _selectedIndex == 1
            //       ? Stack(
            //           alignment: Alignment.center,
            //           children: [
            //             const CircleAvatar(
            //               radius: 20,
            //               backgroundColor: Color(0xFF2C49A7),
            //             ),
            //             Positioned(
            //               top: 0,
            //               right: 0,
            //               bottom: 0,
            //               left: 0,
            //               child: Icon(
            //                 TernavIcons.lightOutline.document,
            //                 size: 23,
            //               ),
            //             ),
            //           ],
            //         )
            //       : Icon(
            //           TernavIcons.lightOutline.document,
            //           size: 23,
            //         ),
            //   label: '',
            // ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? Stack(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFF2C49A7),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          bottom: 0,
                          left: 0,
                          child: Icon(
                            TernavIcons.lightOutline.menu,
                            size: 23,
                          ),
                        ),
                      ],
                    )
                  : Icon(
                      TernavIcons.lightOutline.menu,
                      size: 23,
                    ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? Stack(
                      children: const [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFF2C49A7),
                        ),
                        Icon(Icons.camera_alt_outlined),
                        Positioned(
                          top: 0,
                          right: 0,
                          bottom: 0,
                          left: 0,
                          child: Icon(Icons.business),
                        ),
                      ],
                    )
                  : const Icon(Icons.camera_alt_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _selectedIndex == 4
                  ? Stack(
                      children: const [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFF2C49A7),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          bottom: 0,
                          left: 0,
                          child: Icon(Icons.person),
                        ),
                      ],
                    )
                  : const Icon(Icons.person_outline_outlined),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 40.0, top: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 58,
                            height: 58,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(200),
                              child: Image.asset(
                                'assets/Doctor.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // const SizedBox(
                              //   height: 20.0,
                              // ),
                              Text(
                                ' Welcome back',
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color:
                                      const Color.fromARGB(210, 118, 118, 119),
                                ),
                              ),
                              Text(
                                ref.watch(newUserDataProivder)!.fname??"",
                                style: GoogleFonts.poppins(
                                  height: 1.2,
                                  fontSize: 28,
                                  color: const Color.fromARGB(255, 1, 6, 29),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: SvgPicture.asset('assets/textalignright.svg',
                          semanticsLabel: 'Acme Logo'),
                      onPressed: () =>
                          _scaffoldKey.currentState!.openEndDrawer(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Patients',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              height: 130,
              child: Stack(
                children: [
                  FutureBuilder(
                    future: HistoryService.gethistory(
                        ref.read(newUserDataProivder.notifier).state!.ID),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        final data = snapshot.data!;
                        print(data);
                        return SizedBox(
                          height: 400,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: data["listofpatients"].length,
                            itemBuilder: (context, index) {
                              return index == 0
                                  ? Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: const Color(0xFF6989F2),
                                        ),
                                        height: 70,
                                        width: 120,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const AddPatient(),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFF2C49A7),
                                                ),
                                                child: SvgPicture.asset(
                                                  'assets/add.svg',
                                                  semanticsLabel: 'Acme Logo',
                                                  width: 37.0,
                                                  height: 37.0,
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                "Add Patient",
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : FutureBuilder(
                                      future: HistoryService.getpatient(
                                          data["listofpatients"][index]),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          final patientdata = snapshot.data!["data"];
                                          final patientId = snapshot.data!["id"];
                                          return GestureDetector(
                                            onTap: () {
                                              ref.read(patientDataProivder.notifier).state = patientdata;
                                              ref.read(patientIDProivder.notifier).state = patientId;
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PatientProfile(),
                                                ),
                                              );
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  color:
                                                      const Color(0xFF2C49A7),
                                                ),
                                                height: 70,
                                                width: 120,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 13.0,
                                                              bottom: 15.0),
                                                      child: Container(
                                                        width: 45,
                                                        height: 45,
                                                        padding:
                                                            const EdgeInsets
                                                                .all(7),
                                                        decoration:
                                                            const BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color:
                                                              Color(0xFF6989F2),
                                                        ),
                                                        child:
                                                            const CircleAvatar(
                                                          backgroundImage:
                                                              AssetImage(
                                                                  'assets/Profile.png'),
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        patientdata["fname"] +" " + patientdata["lname"],
                                                        style:
                                                            GoogleFonts.poppins(
                                                          fontSize: 14,
                                                          color: const Color
                                                                  .fromARGB(255,
                                                              255, 255, 255),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        return Container();
                                      });
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return Container();
                    }),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Container(

                          //   padding: const EdgeInsets.all(5),
                          //   color: Colors.red,
                          //   child: const Icon(Icons.chevron_right),
                          // ),
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(13),
                              ),
                              color: Color(0xFF6989F2),
                            ),
                            child: const Icon(Icons.chevron_right,
                                size: 30, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Results',
                style: GoogleFonts.poppins(
                  fontSize: 17,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15.0),
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFFD9D9D9),
                      ),
                      height: 160,
                      width: 150,
                      child: Image.asset(
                        "assets/baby2.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
