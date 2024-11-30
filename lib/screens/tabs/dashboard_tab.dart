import 'package:ezmonitoring/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 400,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.groups_2_outlined,
                        size: 100,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text: 'Total Employees',
                        fontSize: 28,
                        fontFamily: 'Bold',
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text: '75',
                        fontSize: 50,
                        fontFamily: 'Bold',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 400,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.groups_2_outlined,
                        size: 100,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text: 'Total Visitors',
                        fontSize: 28,
                        fontFamily: 'Bold',
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextWidget(
                        text: '75',
                        fontSize: 50,
                        fontFamily: 'Bold',
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Wrap(
              children: [
                for (int i = 0; i < 5; i++)
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      width: 400,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.house_outlined,
                            size: 100,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextWidget(
                            text: 'Sector ${i + 1}',
                            fontSize: 32,
                            fontFamily: 'Bold',
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    text: 'Employees',
                                    fontSize: 24,
                                    fontFamily: 'Bold',
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextWidget(
                                    text: '75',
                                    fontSize: 28,
                                    fontFamily: 'Bold',
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    text: 'Visitors',
                                    fontSize: 24,
                                    fontFamily: 'Bold',
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  TextWidget(
                                    text: '75',
                                    fontSize: 28,
                                    fontFamily: 'Bold',
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
