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

void getStarted_addData(UnmodifiableMapView<int, int> entries) async {

    // [START get_started_add_data_1]
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    };

    // Add a new document with a generated ID
    db.collection("users").add(user).then((DocumentReference doc) =>
        debugPrint('DocumentSnapshot added with ID: ${doc.id}'));
    // [END get_started_add_data_1]
  }

FirebaseFirestore getDatabase() {
  return db;
}