import 'package:flutter/material.dart';

import '../../config/size_config.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // if (Responsive.isDesktop(context))
            //   const Expanded(
            //     flex: 1,
            //     child: SideMenu(),
            //   ),
            Expanded(
                flex: 10,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Table
                        DataTable(
                          columnSpacing: 30,
                          columns: const [
                            DataColumn(
                                label: Text('Name',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Code',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Password',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('View',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.cyan,
                                        fontWeight: FontWeight.bold))),
                          ],
                          rows: const [
                            DataRow(cells: [
                              DataCell(Text('1')),
                              DataCell(Text('Stephen')),
                              DataCell(Text('Actor')),
                              DataCell(Text('Actor')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('5')),
                              DataCell(Text('John')),
                              DataCell(Text('Student')),
                              DataCell(Text('Actor')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('10')),
                              DataCell(Text('Harry')),
                              DataCell(Text('Leader')),
                              DataCell(Text('Actor')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('15')),
                              DataCell(Text('Peter')),
                              DataCell(Text('Scientist')),
                              DataCell(Text('Actor')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('15')),
                              DataCell(Text('Peter')),
                              DataCell(Text('Scientist')),
                              DataCell(Text('Actor')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('15')),
                              DataCell(Text('Peter')),
                              DataCell(Text('Scientist')),
                              DataCell(Text('Actor')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('15')),
                              DataCell(Text('Peter')),
                              DataCell(Text('Scientist')),
                              DataCell(Text('Actor')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('15')),
                              DataCell(Text('Peter')),
                              DataCell(Text('Scientist')),
                              DataCell(Text('Actor')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('15')),
                              DataCell(Text('Peter')),
                              DataCell(Text('Scientist')),
                              DataCell(Text('Actor')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('15')),
                              DataCell(Text('Peter')),
                              DataCell(Text('Scientist')),
                              DataCell(Text('Actor')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('15')),
                              DataCell(Text('Peter')),
                              DataCell(Text('Scientist')),
                              DataCell(Text('Actor')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('15')),
                              DataCell(Text('Peter')),
                              DataCell(Text('Scientist')),
                              DataCell(Text('Actor')),
                            ]),
                          ],
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
