import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezmonitoring/utils/const.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future addSector(sector) async {
  final docUser = FirebaseFirestore.instance.collection('Sector').doc(sector);

  final json = {
    'sector': sector,
    'isVerified': false,
    'dateTime': DateTime.now(),
  };

  await docUser.set(json);
}
