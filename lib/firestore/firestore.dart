import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:quiver/iterables.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// Pain Diary
void addData(UnmodifiableMapView<int, int> entries) async {
  // [START get_started_add_data_1]
  // Create a new user with a first and last name
  final storedEntries = <String, dynamic>{};
  for (int i = 0; i < entries.length; i++) {
    storedEntries["q$i"] = entries[i];
  }
  // Add a new document with a generated ID
  // db.collection("Pain Diary Entries").add(storedEntries).then(
  //     (DocumentReference doc) =>
  //         debugPrint('DocumentSnapshot added with ID: ${doc.id}'));

  //add entry into patient database
  db
      .collection("Patient")
      .doc("6827485") // un hard-code this
      .collection("PainDiary")
      .add(storedEntries)
      .then((DocumentReference doc) =>
          debugPrint('patient entry added with ID: ${doc.id}'));
  // [END get_started_add_data_1]
}

// Practitioner Patient List
// Future<Map<dynamic, dynamic>> retrievePatientsList() async {
//   Map<dynamic, dynamic> list =
//       await db.collection("Practitioner").doc("ORVKtlLSLSovmRfxxPq5").get().then((DocumentSnapshot doc) {
//     debugPrint(doc.data().toString());
//     return doc.data() as Map<String, dynamic>;
//   }, onError: (e) => debugPrint("Error getting document: $e"));

//   return list;
// }
Future<Map<dynamic, dynamic>>? retrieveQuestions() async {
  debugPrint("Retrieve Questions");

  Map<dynamic, dynamic> list = await db
      .collection("Pain Diary Questions")
      .doc("S3tecvHL4Vivoe2EomXj")
      .get()
      .then((DocumentSnapshot doc) {
    debugPrint(doc.data().toString());
    return doc.data() as Map<String, dynamic>;
  }, onError: (e) => debugPrint("Error getting document: $e"));

  List<dynamic> questions = list["questions"];
  return list;
  // return questions;
}

Future<List<dynamic>>? retrievePatients() async {
  debugPrint("Retrieve patients");

  Map<dynamic, dynamic> list = await db
      .collection("Practitioner")
      .doc("ORVKtlLSLSovmRfxxPq5")
      .get()
      .then((DocumentSnapshot doc) {
    debugPrint(doc.data().toString());
    return doc.data() as Map<String, dynamic>;
  }, onError: (e) => debugPrint("Error getting document: $e"));

  List<dynamic> patients = list["patients"];
  debugPrint("zzzzz");
  debugPrint(patients.toString());

  return patients;
}

// Add Patients
void addPatient() async {
  final data = {
    "active": true,
    "deceasedBoolean": false,
    "gender": "M",
    "id": "6958493",
    "birthdate": DateTime(2001, 12, 17),
    "identifier": "293-58-2919",
    "maritalStatus": "",
    "name": {
      "family": "Guo",
      "given": "Jason",
      "prefix": "",
      "suffix": "",
      "text": "Jason Guo",
      "use": "legal"
    }
  };
  db.collection("Patient").add(data).then((DocumentReference doc) =>
      debugPrint('DocumentSnapshot added with ID: ${doc.id}'));
}

FirebaseFirestore getDatabase() {
  return db;
}
