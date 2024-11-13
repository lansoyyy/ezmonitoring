import 'package:ezmonitoring/utils/colors.dart';
import 'package:ezmonitoring/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ReportTab extends StatefulWidget {
  const ReportTab({super.key});

  @override
  State<ReportTab> createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
  final searchController = TextEditingController();
  String nameSearched = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.save,
        ),
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 20),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Regular',
                          fontSize: 14,
                        ),
                        onChanged: (value) {
                          setState(() {
                            nameSearched = value;
                          });
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: Colors.black),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontFamily: 'Regular',
                            fontSize: 16,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                        controller: searchController,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: DataTable(
                columns: [
                  DataColumn(
                    label: TextWidget(
                      text: 'RFID ID Number',
                      fontSize: 18,
                      fontFamily: 'Bold',
                      color: primary,
                    ),
                  ),
                  DataColumn(
                    label: TextWidget(
                      text: 'Full Name',
                      fontSize: 18,
                      fontFamily: 'Bold',
                      color: primary,
                    ),
                  ),
                  DataColumn(
                    label: TextWidget(
                      text: 'Contact No.',
                      fontSize: 18,
                      fontFamily: 'Bold',
                      color: primary,
                    ),
                  ),
                  DataColumn(
                    label: TextWidget(
                      text: 'Date',
                      fontSize: 18,
                      fontFamily: 'Bold',
                      color: primary,
                    ),
                  ),
                  DataColumn(
                    label: TextWidget(
                      text: 'Time in',
                      fontSize: 18,
                      fontFamily: 'Bold',
                      color: primary,
                    ),
                  ),
                  DataColumn(
                    label: TextWidget(
                      text: 'Time out',
                      fontSize: 18,
                      fontFamily: 'Bold',
                      color: primary,
                    ),
                  ),
                  DataColumn(
                    label: TextWidget(
                      text: 'Visitors/Personnel',
                      fontSize: 18,
                      fontFamily: 'Bold',
                      color: primary,
                    ),
                  ),
                ],
                rows: [
                  for (int i = 0; i < 5; i++)
                    DataRow(cells: [
                      DataCell(
                        TextWidget(
                          text: '${i + 1}. Data here',
                          fontSize: 14,
                          fontFamily: 'Medium',
                          color: Colors.grey,
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: 'Data here',
                          fontSize: 14,
                          fontFamily: 'Medium',
                          color: Colors.grey,
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: 'Data here',
                          fontSize: 14,
                          fontFamily: 'Medium',
                          color: Colors.grey,
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: 'Data here',
                          fontSize: 14,
                          fontFamily: 'Medium',
                          color: Colors.grey,
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: 'Data here',
                          fontSize: 14,
                          fontFamily: 'Medium',
                          color: Colors.grey,
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: 'Data here',
                          fontSize: 14,
                          fontFamily: 'Medium',
                          color: Colors.grey,
                        ),
                      ),
                      DataCell(
                        TextWidget(
                          text: 'Data here',
                          fontSize: 14,
                          fontFamily: 'Medium',
                          color: Colors.grey,
                        ),
                      ),
                    ])
                ],
                // DataTable's properties to add inner horizontal and vertical dividers
                dividerThickness: 1, // Horizontal dividers between rows
                border: const TableBorder(
                  horizontalInside: BorderSide(
                      color: Colors.grey, width: 1), // Horizontal dividers
                  verticalInside: BorderSide(
                      color: Colors.grey, width: 1), // Vertical dividers
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
