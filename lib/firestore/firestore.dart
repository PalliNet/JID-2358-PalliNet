import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:pallinet/constants.dart';
import 'package:pallinet/models/patient_model.dart';
import 'package:quiver/iterables.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// Pain Diary
void addData(UnmodifiableMapView<int, int> entries) async {
  // [START get_started_add_data_1]
  // Create a new user with a first and last name
  final storedEntries = <String, dynamic>{
    "q1": entries[0],
    "q2": entries[1],
    "q3": entries[2],
    "q4": entries[3],
    "q5": entries[4]
  };
  // Add a new document with a generated ID
  db
      .collection("Pain Diary Entries")
      .add(storedEntries)
      .then((DocumentReference doc) => debugPrint('DocumentSnapshot added with ID: ${doc.id}'));
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

Future<List<dynamic>>? retrievePatients() async {
  debugPrint("Retrieve patients");

  Map<dynamic, dynamic> list =
      await db.collection("Practitioner").doc("ORVKtlLSLSovmRfxxPq5").get().then((DocumentSnapshot doc) {
    debugPrint(doc.data().toString());
    return doc.data() as Map<String, dynamic>;
  }, onError: (e) => debugPrint("Error getting document: $e"));

  List<dynamic> patients = list["patients"];
  debugPrint("zzzzz");
  debugPrint(patients.toString());

  return patients;
}

Future<List<PatientID>>? retrievePatients2() async {
  debugPrint("Retrieve patients");

  Map<dynamic, dynamic> list =
      await db.collection("Practitioner").doc("ORVKtlLSLSovmRfxxPq5").get().then((DocumentSnapshot doc) {
    return doc.data() as Map<String, dynamic>;
  }, onError: (e) => debugPrint("Error getting document: $e"));

  List<dynamic> data = list["patients"];
  debugPrint(data.toString());
  List<PatientID> patients = data.map((e) {
    // debugPrint(e.runtimeType.toString());
    debugPrint(e.toString());
    Gender gender = e["gender"] == "M" ? Gender.male : Gender.female;
    Timestamp t = e["birthDate"] as Timestamp;
    DateTime birthdate = t.toDate();

    return PatientID(e["name"], gender, e["id"], birthdate);
  }).toList();

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
    "name": {"family": "Guo", "given": "Jason", "prefix": "", "suffix": "", "text": "Jason Guo", "use": "legal"}
  };
  db
      .collection("Patient")
      .add(data)
      .then((DocumentReference doc) => debugPrint('DocumentSnapshot added with ID: ${doc.id}'));
}

FirebaseFirestore getDatabase() {
  return db;
}
