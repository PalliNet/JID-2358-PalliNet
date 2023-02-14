import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:pallinet/constants.dart';
import 'package:pallinet/models/patient_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/physician_model.dart';

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
      .then((DocumentReference doc) => debugPrint('patient entry added with ID: ${doc.id}'));
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

  Map<dynamic, dynamic> list =
      await db.collection("Pain Diary Questions").doc("S3tecvHL4Vivoe2EomXj").get().then((DocumentSnapshot doc) {
    debugPrint(doc.data().toString());
    return doc.data() as Map<String, dynamic>;
  }, onError: (e) => debugPrint("Error getting document: $e"));

  List<dynamic> questions = list["questions"];
  return list;
  // return questions;
}

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

// TODO this might be wrong? Check if still works with const.dart
// TODO this is probably broken rn, need to fix database entries so that field
// name is consistent (birthdate instead of birthDate)
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
    Timestamp t = e["birthdate"] as Timestamp;
    DateTime birthdate = t.toDate();

    return PatientID(e["name"], gender, e["id"], birthdate);
  }).toList();

  return patients;
}

void createAppointment(Map<String, dynamic> payload) async {
  debugPrint("Create appointment");
  debugPrint(payload.toString());

  final appointmentsRef = db.collection("Appointment");

  await appointmentsRef.add({
    "appointmentType": payload["type"],
    "description": payload["description"],
    "created": DateTime.now(),
    "serviceCategory": "appointment",
  }).then((value) => debugPrint(value.toString()), onError: (e) => debugPrint("Error occured: $e"));

  Map<dynamic, dynamic> list =
      await db.collection("Practitioner").doc("ORVKtlLSLSovmRfxxPq5").get().then((DocumentSnapshot doc) {
    return doc.data() as Map<String, dynamic>;
  }, onError: (e) => debugPrint("Error getting document: $e"));
}

// Add Patients
// void addPatient() async {
//   final data = {
//     "active": true,
//     "deceasedBoolean": false,
//     "gender": "M",
//     "id": "6958493",
//     "birthdate": DateTime(2001, 12, 17),
//     "identifier": "111-11-1111",
//     "maritalStatus": "",
//     "name": {
//       "family": "Guo",
//       "given": "Jason",
//       "prefix": "",
//       "suffix": "",
//       "text": "Jason Guo",
//       "use": "legal"
//     }
//   };
//   db.collection("Patient").add(data).then((DocumentReference doc) =>
//       debugPrint('DocumentSnapshot added with ID: ${doc.id}'));
// }

void updatePhysicianProfile(Map<String, dynamic> payload) async {
  // debugPrint("Update physician");
  // docRef = db.collection("Practitioner").doc(id);

  await db.collection("Practitioner").doc("ORVKtlLSLSovmRfxxPq5").update({"description": payload["description"]});
}

Future<PatientID>? retrievePatientProfile(uid) async {
  Map<dynamic, dynamic> patientInfo = await db.collection("Patient").doc(uid).get().then((DocumentSnapshot doc) {
    return doc.data() as Map<String, dynamic>;
  }, onError: (e) => debugPrint("Error getting document: $e"));

  Gender gender = patientInfo["gender"] == "Male" ? Gender.male : Gender.female;
  Timestamp t = patientInfo["birthdate"] as Timestamp;
  DateTime birthdate = t.toDate();

  PatientID patient = PatientID(patientInfo["name"]["text"], gender, patientInfo["id"], birthdate);

  return patient;
}

Future<Physician>? retrievePhysicianProfile() async {
  // debugPrint("Update physician");

  Map<dynamic, dynamic> list =
      await db.collection("Practitioner").doc("ORVKtlLSLSovmRfxxPq5").get().then((DocumentSnapshot doc) {
    return doc.data() as Map<String, dynamic>;
  }, onError: (e) => debugPrint("Error getting document: $e"));

  // debugPrint(list.toString());
  // debugPrint("Success");
  Physician physician =
      Physician(list["name"], list["gender"] == "M" ? Gender.male : Gender.female, list["id"], list["description"]);

  // debugPrint("1");
  // debugPrint(list["description"]);
  // debugPrint("2");
  // debugPrint(physician.description);

  // List<dynamic> data = list["id"] + list["description"] + list["gender"] + list["name"];
  // debugPrint(data.toString());
  // Physician physician = data.map((e) {
  //   debugPrint(e.toString());
  //   Gender gender = e["gender"] == "M" ? Gender.male : Gender.female;
  //   return Physician(e["name"], gender, e["id"], e["description"]);

  // }).toList();

  return physician;
}

FirebaseFirestore getDatabase() {
  return db;
}
