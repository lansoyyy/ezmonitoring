import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezmonitoring/utils/colors.dart';
import 'package:ezmonitoring/widgets/text_widget.dart';
import 'package:ezmonitoring/widgets/toast_widget.dart';
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
          // Align(
          //   alignment: Alignment.topRight,
          //   child: Card(
          //     color: Colors.amber,
          //     child: SizedBox(
          //       width: 200,
          //       child: ListTile(
          //         onTap: () {
          //           createDialog();
          //         },
          //         title: TextWidget(
          //           text: 'Add New',
          //           fontSize: 18,
          //           fontFamily: 'Bold',
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Users').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(child: Text('Error'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                        child: CircularProgressIndicator(
                      color: Colors.black,
                    )),
                  );
                }

                final data = snapshot.requireData;
                return Container(
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
                      for (int i = 0; i < data.docs.length; i++)
                        DataRow(cells: [
                          DataCell(
                            TextWidget(
                              text: data.docs[i]['id'],
                              fontSize: 14,
                              fontFamily: 'Medium',
                              color: Colors.grey,
                            ),
                          ),
                          DataCell(
                            TextWidget(
                              text: data.docs[i]['name'],
                              fontSize: 14,
                              fontFamily: 'Medium',
                              color: Colors.grey,
                            ),
                          ),
                          DataCell(
                            TextWidget(
                              text: data.docs[i]['number'],
                              fontSize: 14,
                              fontFamily: 'Medium',
                              color: Colors.grey,
                            ),
                          ),
                          DataCell(
                            TextWidget(
                              text: data.docs[i]['address'],
                              fontSize: 14,
                              fontFamily: 'Medium',
                              color: Colors.grey,
                            ),
                          ),
                          DataCell(
                            TextWidget(
                              text: data.docs[i]['sector'],
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
                                        onTap: () async {
                                          await FirebaseFirestore.instance
                                              .collection('Users')
                                              .doc(data.docs[i].id)
                                              .delete();
                                          showToast('Personnel Deleted');
                                        },
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
                                        onTap: () {
                                          createDialog(data.docs[i], true);
                                        },
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
                );
              })
        ],
      ),
    );
  }

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController rfidController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController sectorController = TextEditingController();
  createDialog(dynamic data, bool inUpdate) {
    fullnameController.text = data['name'];
    rfidController.text = data['id'];
    contactController.text = data['number'];
    addressController.text = data['address'];
    sectorController.text = data['sector'];
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
              inUpdate ? 'Update Employee Details' : 'Create New Employee'),
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
              onPressed: () async {
                await FirebaseFirestore.instance
                    .collection('Users')
                    .doc(data.id)
                    .update({
                  'name': fullnameController.text,
                  'number': contactController.text,
                  'address': addressController.text,
                  'id': rfidController.text,
                  'sector': sectorController.text
                });
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
