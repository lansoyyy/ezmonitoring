import 'package:ezmonitoring/utils/colors.dart';
import 'package:ezmonitoring/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class EmployeeTab extends StatefulWidget {
  const EmployeeTab({super.key});

  @override
  State<EmployeeTab> createState() => _EmployeeTabState();
}

class _EmployeeTabState extends State<EmployeeTab> {
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
            child: Card(
              color: Colors.amber,
              child: SizedBox(
                width: 200,
                child: ListTile(
                  onTap: () {
                    createDialog();
                  },
                  title: TextWidget(
                    text: 'Add New',
                    fontSize: 18,
                    fontFamily: 'Bold',
                    color: Colors.white,
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
                    text: 'Address',
                    fontSize: 18,
                    fontFamily: 'Bold',
                    color: primary,
                  ),
                ),
                DataColumn(
                  label: TextWidget(
                    text: 'Assigned Sector',
                    fontSize: 18,
                    fontFamily: 'Bold',
                    color: primary,
                  ),
                ),
                DataColumn(
                  label: TextWidget(
                    text: '',
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
                      SizedBox(
                        width: 300,
                        child: Row(
                          children: [
                            Card(
                              color: Colors.red,
                              child: SizedBox(
                                width: 100,
                                child: ListTile(
                                  onTap: () {},
                                  title: TextWidget(
                                    text: 'Delete',
                                    fontSize: 14,
                                    fontFamily: 'Bold',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Card(
                              color: Colors.blue,
                              child: SizedBox(
                                width: 100,
                                child: ListTile(
                                  onTap: () {},
                                  title: TextWidget(
                                    text: 'Edit',
                                    fontSize: 14,
                                    fontFamily: 'Bold',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController rfidController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController sectorController = TextEditingController();
  createDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create New Employee'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: fullnameController,
                  decoration: const InputDecoration(
                    labelText: 'Fullname',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: rfidController,
                  decoration: const InputDecoration(
                    labelText: 'RFID Number',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: contactController,
                  decoration: const InputDecoration(
                    labelText: 'Contact No.',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: sectorController,
                  decoration: const InputDecoration(
                    labelText: 'Assigned Sector',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle saving the new employee's information here
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
