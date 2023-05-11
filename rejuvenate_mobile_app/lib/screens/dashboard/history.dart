import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejuvenate_mobile_app/services/history_service.dart';

import '../../config/size_config.dart';
import '../../providers/user_provider.dart';

class History extends ConsumerStatefulWidget {
  const History({super.key});
  @override
  ConsumerState<History> createState() => _HistoryState();
}

class _HistoryState extends ConsumerState<History> {
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
                    child: Column(children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Patients",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 25,
                            color: const Color.fromARGB(255, 13, 71, 161),
                            fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                        color: Colors.black12,
                      ),
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
                                  itemCount: data["listofpatients"].length,
                                  itemBuilder: (context, index) {
                                    return FutureBuilder(
                                        future: HistoryService.getpatient(
                                            data["listofpatients"][index]),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            final patientdata = snapshot.data!;
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: ListTile(
                                                leading: const Icon(
                                                    Icons.person,
                                                    color: Color.fromARGB(
                                                        255, 13, 71, 161)),
                                                title: Text(
                                                    patientdata["fname"] +
                                                        " " +
                                                        patientdata["lname"]),
                                                subtitle: Text(
                                                    patientdata["problemtype"]),
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
                          }))
                    ]),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
