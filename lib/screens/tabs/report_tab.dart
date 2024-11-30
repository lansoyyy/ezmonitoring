import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezmonitoring/utils/colors.dart';
import 'package:ezmonitoring/widgets/text_widget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportTab extends StatefulWidget {
  const ReportTab({super.key});

  @override
  State<ReportTab> createState() => _ReportTabState();
}

class _ReportTabState extends State<ReportTab> {
  final searchController = TextEditingController();
  String nameSearched = '';

  bool hasLoaded = false;

  List users = [];

  @override
  void initState() {
    super.initState();
    getAllUsers();
  }

  getAllUsers() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        setState(() {
          users.add(doc.data());
        });
      }
    });

    setState(() {
      hasLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return hasLoaded
        ? Scaffold(
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
                  StreamBuilder<DatabaseEvent>(
                      stream:
                          FirebaseDatabase.instance.ref("rfid_data").onValue,
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                          return const Center(child: Text('Error'));
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (snapshot.hasData) {
                          final data = snapshot.data!.snapshot.value;

                          if (data == null) {
                            return const Center(
                                child: Text('No data available'));
                          }

                          // Convert dynamic data to a list of maps
                          final Map<dynamic, dynamic> dataMap =
                              data as Map<dynamic, dynamic>;
                          final List<Map<String, dynamic>> itemList =
                              dataMap.values.map((innerValue) {
                            return {
                              "Date": innerValue["Date"],
                              "ID": innerValue["ID"],
                              "Timestamp": innerValue["Timestamp"],
                            };
                          }).toList();

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
                                for (int i = 0; i < itemList.length; i++)
                                  DataRow(cells: [
                                    DataCell(
                                      TextWidget(
                                        text: itemList[i]['ID'].toString(),
                                        fontSize: 14,
                                        fontFamily: 'Medium',
                                        color: Colors.grey,
                                      ),
                                    ),
                                    DataCell(
                                      TextWidget(
                                        text: users.where(
                                          (element) {
                                            return element['id'] ==
                                                itemList[i]['ID'].toString();
                                          },
                                        ).first['name'],
                                        fontSize: 14,
                                        fontFamily: 'Medium',
                                        color: Colors.grey,
                                      ),
                                    ),
                                    DataCell(
                                      TextWidget(
                                        text: users.where(
                                          (element) {
                                            return element['id'] ==
                                                itemList[i]['ID'].toString();
                                          },
                                        ).first['number'],
                                        fontSize: 14,
                                        fontFamily: 'Medium',
                                        color: Colors.grey,
                                      ),
                                    ),
                                    DataCell(
                                      TextWidget(
                                        text: DateFormat('yyyy-MM-dd')
                                            .format(DateTime.now()),
                                        fontSize: 14,
                                        fontFamily: 'Medium',
                                        color: Colors.grey,
                                      ),
                                    ),
                                    DataCell(
                                      TextWidget(
                                        text: itemList[i]['Timestamp'],
                                        fontSize: 14,
                                        fontFamily: 'Medium',
                                        color: Colors.grey,
                                      ),
                                    ),
                                    DataCell(
                                      TextWidget(
                                        text: '',
                                        fontSize: 14,
                                        fontFamily: 'Medium',
                                        color: Colors.grey,
                                      ),
                                    ),
                                    DataCell(
                                      TextWidget(
                                        text: users.where(
                                          (element) {
                                            return element['id'] ==
                                                itemList[i]['ID'].toString();
                                          },
                                        ).first['type'],
                                        fontSize: 14,
                                        fontFamily: 'Medium',
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ])
                              ],
                              // DataTable's properties to add inner horizontal and vertical dividers
                              dividerThickness:
                                  1, // Horizontal dividers between rows
                              border: const TableBorder(
                                horizontalInside: BorderSide(
                                    color: Colors.grey,
                                    width: 1), // Horizontal dividers
                                verticalInside: BorderSide(
                                    color: Colors.grey,
                                    width: 1), // Vertical dividers
                              ),
                            ),
                          );
                        }
                        return const Center(child: Text('No data found'));
                      })
                ],
              ),
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
