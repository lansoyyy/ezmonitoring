import 'package:cloud_firestore/cloud_firestore.dart';
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
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .snapshots(),
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
                              text: data.docs.length.toString(),
                              fontSize: 50,
                              fontFamily: 'Bold',
                              color: Colors.white,
                            ),
                          ],
                        ),
                      );
                    }),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Visitors')
                        .snapshots(),
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
                              text: data.docs.length.toString(),
                              fontSize: 50,
                              fontFamily: 'Bold',
                              color: Colors.white,
                            ),
                          ],
                        ),
                      );
                    }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('Sector').snapshots(),
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
                  return Wrap(
                    children: [
                      for (int i = 0; i < data.docs.length; i++)
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
                                  text: data.docs[i]['sector'],
                                  fontSize: 32,
                                  fontFamily: 'Bold',
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection('Users')
                                            .where('sector',
                                                isEqualTo: data.docs[i]
                                                    ['sector'])
                                            .snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          if (snapshot.hasError) {
                                            print(snapshot.error);
                                            return const Center(
                                                child: Text('Error'));
                                          }
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Padding(
                                              padding: EdgeInsets.only(top: 50),
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                color: Colors.black,
                                              )),
                                            );
                                          }

                                          final data = snapshot.requireData;
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                text:
                                                    data.docs.length.toString(),
                                                fontSize: 28,
                                                fontFamily: 'Bold',
                                                color: Colors.white,
                                              ),
                                            ],
                                          );
                                        }),
                                    StreamBuilder<QuerySnapshot>(
                                        stream: FirebaseFirestore.instance
                                            .collection('Visitors')
                                            .where('sector',
                                                isEqualTo: data.docs[i]
                                                    ['sector'])
                                            .snapshots(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<QuerySnapshot>
                                                snapshot) {
                                          if (snapshot.hasError) {
                                            print(snapshot.error);
                                            return const Center(
                                                child: Text('Error'));
                                          }
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const Padding(
                                              padding: EdgeInsets.only(top: 50),
                                              child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                color: Colors.black,
                                              )),
                                            );
                                          }

                                          final data = snapshot.requireData;
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                text:
                                                    data.docs.length.toString(),
                                                fontSize: 28,
                                                fontFamily: 'Bold',
                                                color: Colors.white,
                                              ),
                                            ],
                                          );
                                        }),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
