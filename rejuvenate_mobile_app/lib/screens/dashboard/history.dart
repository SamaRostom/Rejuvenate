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
                                        color: Color.fromRGBO(13, 71, 161, 1),
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Age',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(13, 71, 161, 1),
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Gender',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color.fromRGBO(13, 71, 161, 1),
                                        fontWeight: FontWeight.bold))),
                          ],
                          rows: const [
                            DataRow(cells: [
                              DataCell(Text('1')),
                              DataCell(Text('Stephen')),
                              DataCell(Text('1')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('5')),
                              DataCell(Text('John')),
                              DataCell(Text('3')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('10')),
                              DataCell(Text('Harry')),
                              DataCell(Text('3')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('15')),
                              DataCell(Text('Peter')),
                              DataCell(Text('1')),
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
