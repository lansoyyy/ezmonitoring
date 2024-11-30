import 'package:ezmonitoring/screens/auth/login_screen.dart';
import 'package:ezmonitoring/screens/tabs/dashboard_tab.dart';
import 'package:ezmonitoring/screens/tabs/employee_tab.dart';
import 'package:ezmonitoring/screens/tabs/monitoring_tab.dart';
import 'package:ezmonitoring/screens/tabs/report_tab.dart';
import 'package:ezmonitoring/screens/tabs/visitors_tab.dart';

import 'package:ezmonitoring/utils/colors.dart';
import 'package:ezmonitoring/widgets/logout_widget.dart';
import 'package:ezmonitoring/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  String type;

  HomeScreen({super.key, required this.type});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List items = [
    'Dashboard',
    'Monitoring',
    'Employee',
    'Visitors',
    'Report Logs'
  ];

  List items1 = [
    'Monitoring',
    'Visitors',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SizedBox(
              width: 200,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: TextWidget(
                      text: 'EZ Monitoring',
                      fontSize: 24,
                      fontFamily: 'Bold',
                      color: Colors.white,
                    ),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (widget.type == 'Admin')
                    for (int i = 0; i < items.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        child: Card(
                          color: Colors.white,
                          child: SizedBox(
                            width: 200,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  index = i;
                                });
                              },
                              title: TextWidget(
                                text: items[i],
                                fontSize: 18,
                                fontFamily: 'Bold',
                                color: index == i ? Colors.blue : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                  if (widget.type == 'Personnel')
                    for (int i = 0; i < items1.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        child: Card(
                          color: Colors.white,
                          child: SizedBox(
                            width: 200,
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  index = i;
                                });
                              },
                              title: TextWidget(
                                text: items1[i],
                                fontSize: 18,
                                fontFamily: 'Bold',
                                color: index == i ? Colors.blue : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5, top: 5),
                    child: Card(
                      color: Colors.white,
                      child: SizedBox(
                        width: 200,
                        child: ListTile(
                          onTap: () {
                            logout(context, const LoginScreen());
                          },
                          title: TextWidget(
                            text: 'Logout',
                            fontSize: 18,
                            fontFamily: 'Bold',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.grey[100],
            child: IndexedStack(
              index: index,
              children: widget.type == 'Personnel'
                  ? [
                      const MonitoringTab(),
                      const VisitorsTab(),
                    ]
                  : [
                      const DashboardTab(),
                      const MonitoringTab(),
                      const EmployeeTab(),
                      const VisitorsTab(),
                      const ReportTab(),
                    ],
            ),
          )),
        ],
      ),
    );
  }
}
