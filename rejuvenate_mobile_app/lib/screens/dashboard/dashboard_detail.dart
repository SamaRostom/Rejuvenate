import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/size_config.dart';
import '../../providers/user_provider.dart';
import '../../services/history_service.dart';
import '../../utils/constants.dart';
import '../../utils/side_menu.dart';

class DashboardDetail extends ConsumerStatefulWidget {
  const DashboardDetail({super.key});

  @override
  ConsumerState<DashboardDetail> createState() => _DashboardDetailState();
}

class _DashboardDetailState extends ConsumerState<DashboardDetail> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: loggedin == true ? const SideMenu1() : const SideMenu2(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 40,
                child: SafeArea(
                  child: SingleChildScrollView(
                    // padding: const EdgeInsets.symmetric(
                    //     vertical: 80, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
              padding: const EdgeInsets.only(left: 350.0,),
              child: IconButton(
                     alignment: Alignment.topLeft,
                      icon: SvgPicture.asset('assets/textalignright.svg',
                          semanticsLabel: 'Acme Logo',alignment: Alignment.topLeft,),
                      onPressed: () =>
                          _scaffoldKey.currentState!.openEndDrawer(),
                    ),
            ),
            SizedBox(
              height: 30,
            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[900]),
                              onPressed: () {
                                Navigator.pushNamed(context, '/addpatient');
                              },
                              child: Wrap(
                                children: const <Widget>[
                                  Icon(
                                    Icons.person_add_alt_1_outlined,
                                    color: Colors.white,
                                    size: 25.0,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Add Patient",
                                      style: TextStyle(fontSize: 24)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 500,
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Material(
                                child: Container(
                                  height: 180.0,
                                  width: 500.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              )),
                              Positioned(
                                  top: 22,
                                  child: Card(
                                    elevation: 10.0,
                                    shadowColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      height: 180,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: const DecorationImage(
                                            // fit:BoxFit.fill,
                                            image: AssetImage(
                                                "assets/patient.jpg"),
                                          )),
                                    ),
                                  )),
                              Positioned(
                                  top: 70,
                                  left: 170,
                                  child: SizedBox(
                                    height: 150.0,
                                    width: 160.0,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Patients Count",
                                            style: GoogleFonts.nunitoSans(
                                                fontSize: 20,
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          FutureBuilder(
                                            future: HistoryService.gethistory(
                                                ref
                                                    .read(newUserDataProivder
                                                        .notifier)
                                                    .state!
                                                    .ID),
                                            builder: ((context, snapshot) {
                                              if (snapshot.hasData) {
                                                final data = snapshot.data!;
                                                print(data);
                                                return Text(
                                                  data["listofpatients"]
                                                      .length
                                                      .toString(),
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                );
                                              }
                                              else if (snapshot.hasError) {
                                                print(snapshot.error);
                                                return Text(
                                                  "0",
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                );
                                              }
                                              return Text(
                                                  "0",
                                                  style: GoogleFonts.nunitoSans(
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                );
                                            }),
                                          )
                                        ]),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
