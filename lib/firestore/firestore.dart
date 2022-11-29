import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';



FirebaseFirestore db = FirebaseFirestore.instance;

final user = <String, dynamic>{
  "first": "Ada",
  "last": "Lovelace",
  "born": 1815
};

void addData(UnmodifiableMapView<int, int> entries) async {

    // [START get_started_add_data_1]
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    };
    final storedEntries = <String, dynamic> {
      "q1": entries[0],
      "q2": entries[1],
      "q3": entries[2],
      "q4": entries[3],
      "q5": entries[4]
    };
    // Add a new document with a generated ID
    db.collection("Pain Diary Entries").add(storedEntries).then((DocumentReference doc) =>
        debugPrint('DocumentSnapshot added with ID: ${doc.id}'));
    // [END get_started_add_data_1]
  }

FirebaseFirestore getDatabase() {
  return db;
}