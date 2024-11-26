import 'package:ezmonitoring/utils/colors.dart';
import 'package:ezmonitoring/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MonitoringTab extends StatefulWidget {
  const MonitoringTab({super.key});

  @override
  State<MonitoringTab> createState() => _MonitoringTabState();
}

class _MonitoringTabState extends State<MonitoringTab> {
  String? selectedRole; // This will hold the selected value
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              width: 200,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                  underline: const SizedBox(),
                  value: selectedRole,
                  hint: const Text('Entrance'),
                  items: [
                    for (int i = 0; i < 5; i++)
                      DropdownMenuItem(
                        value: 'Sector ${i + 1}',
                        child: TextWidget(
                          text: 'Sector ${i + 1}',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedRole = value;
                    });
                  },
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
    );
  }
}