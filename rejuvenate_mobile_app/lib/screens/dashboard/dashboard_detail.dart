import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/size_config.dart';

class DashboardDetail extends StatelessWidget {
  const DashboardDetail({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 30,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[900]
                              ),
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
                          height: 230,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 25,
                                  left: 50,
                                  child: Material(
                                    child: Container(
                                      height: 180.0,
                                      width: 500.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                         
                                          ),
                                    ),
                                  )),
                              Positioned(
                                  top: 22,
                                  child: Card(
                                    elevation: 10.0,
                                    shadowColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      height: 180,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: const DecorationImage(
                                            // fit:BoxFit.fill,
                                            image: AssetImage(
                                                "assets/patient.png"),
                                          )
                                          ),
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
                                          Text(
                                            "142",
                                            style: GoogleFonts.nunitoSans(
                                                fontSize: 18,
                                                color: Colors.grey),
                                          ),
                                        ]),
                                  )),
                              Positioned(
                                top: 150,
                                left: 270,
                                child: TextButton(
                                  child: const Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: 14, color: Color.fromARGB(255, 2, 68, 122)),
                                  ),
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed('/viewprofile'),
                                ),
                              ),

                              
                              
                            ],
                          ),
                        ),
                        ///new 
                        
                          SizedBox(
                          height: 230,
                          child: Stack(
                            children: [
                              Positioned(
                                  top: 25,
                                  left: 50,
                                  child: Material(
                                    child: Container(
                                      height: 180.0,
                                      width: 500.0,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                         
                                          ),
                                    ),
                                  )),
                              Positioned(
                                  top: 22,
                                  child: Card(
                                    elevation: 10.0,
                                    shadowColor: Colors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      height: 180,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: const DecorationImage(
                                            // fit:BoxFit.fill,
                                            image: AssetImage(
                                                "assets/imageresult.png"),
                                          )
                                          ),
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
                                            "Number Of Image Result",
                                            style: GoogleFonts.nunitoSans(
                                                fontSize: 20,
                                                color: Colors.blue[900],
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const Divider(
                                            color: Colors.black,
                                          ),
                                          Text(
                                            "98",
                                            style: GoogleFonts.nunitoSans(
                                                fontSize: 18,
                                                color: Colors.grey),
                                          ),
                                        ]),
                                  )),
                              Positioned(
                                top: 150,
                                left: 270,
                                child: TextButton(
                                  child: const Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: 14, color: Color.fromARGB(255, 2, 68, 122)),
                                  ),
                                  onPressed: () => Navigator.of(context)
                                      .pushNamed('/viewprofile'),
                                ),
                              ),

                              
                              
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
