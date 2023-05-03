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
                                        fontSize: 20,
                                        color: Color.fromRGBO(13, 71, 161, 1),
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Problem Type',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(13, 71, 161, 1),
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Surgery',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromRGBO(13, 71, 161, 1),
                                        fontWeight: FontWeight.bold))),
                          ],
                          rows: const [
                            DataRow(cells: [
                              DataCell(Text('Mostafa', style: TextStyle(fontSize: 16.0))),
                              DataCell(Text('Clift Lip', style: TextStyle(fontSize: 16.0))),
                              DataCell(Text('Done', style: TextStyle(fontSize: 16.0))),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Ahmed', style: TextStyle(fontSize: 16.0))),
                              DataCell(Text('Clift Lip', style: TextStyle(fontSize: 16.0))),
                              DataCell(Text('In Progress', style: TextStyle(fontSize: 16.0))),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Kareem', style: TextStyle(fontSize: 16.0))),
                              DataCell(Text('Clift Lip', style: TextStyle(fontSize: 16.0))),
                              DataCell(Text('In Progress', style: TextStyle(fontSize: 16.0))),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Laila', style: TextStyle(fontSize: 16.0))),
                              DataCell(Text('Clift Lip', style: TextStyle(fontSize: 16.0))),
                              DataCell(Text('Done', style: TextStyle(fontSize: 16.0))),
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
