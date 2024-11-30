import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ezmonitoring/utils/const.dart';

import 'package:firebase_auth/firebase_auth.dart';

Future addVisitor(name, number, rfid, address, sector, email, type) async {
  final docUser = FirebaseFirestore.instance.collection('Visitors').doc(rfid);

  final json = {
    'name': name,
    'number': number,
    'address': address,
    'sector': sector,
    'id': docUser.id,
    'isVerified': false,
    'profile': '',
    'email': email,
    'dateTime': DateTime.now(),
    'type': type,
  };

  await docUser.set(json);
}
