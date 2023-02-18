import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:pallinet/constants.dart';
import 'package:pallinet/models/patient_model.dart';

import '../models/physician_model.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

// Pain Diary
void addData(UnmodifiableMapView<int, int> entries) async {
  // Create a new user with a first and last name
  final storedEntries = <String, dynamic>{};
  for (int i = 0; i < entries.length; i++) {
    storedEntries["q$i"] = entries[i];
  }

  //add entry into patient database
  db
      .collection("Patient")
      .doc("6827485") // un hard-code this
      .collection("PainDiary")
      .add(storedEntries)
      .then((DocumentReference doc) =>
          debugPrint('patient entry added with ID: ${doc.id}'));
}

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
}

Future<List<dynamic>>? retrieveEntries() async {
  debugPrint("Retrieve entries");
  QuerySnapshot querySnapshot = await db
      .collection("Patient")
      .doc("6827485")
      .collection("PainDiary")
      .get();
  List<dynamic> list = querySnapshot.docs.map((doc) => doc.data()).toList();

  debugPrint("out");
  debugPrint(list.toString());
  return list;
  // return questions;
}

// TODO used in patients_list consolidate w/ retrievePatients2 (currently hardcoded)
Future<List<dynamic>>? retrievePatients() async {
  debugPrint("retrievePatients");

  Map<dynamic, dynamic> list = await db
      .collection("Practitioner")
      .doc("5nsl8S4wXoeNLc6OzVgwJGRBmv62")
      .get()
      .then((DocumentSnapshot doc) {
    debugPrint(doc.data().toString());
    return doc.data() as Map<String, dynamic>;
  }, onError: (e) => debugPrint("Error getting document: $e"));

  List<dynamic> patients = list["patients"];
  debugPrint(patients.toString());

  return patients;
}

// TODO this might be wrong? Check if still works with const.dart
// TODO this is probably broken rn, need to fix database entries so that field
// TODO name is consistent (birthdate instead of birthdate) (currently hardcoded)
Future<List<PatientID>>? retrievePatients2() async {
  debugPrint("retrievePatients2");

  Map<dynamic, dynamic> list = await db
      .collection("Practitioner")
      .doc("5nsl8S4wXoeNLc6OzVgwJGRBmv62")
      .get()
      .then((DocumentSnapshot doc) {
    return doc.data() as Map<String, dynamic>;
  }, onError: (e) => debugPrint("Error getting document: $e"));

  List<dynamic> data = list["patients"];
  debugPrint(data.toString());
  List<PatientID> patients = data.map((e) {
    Gender gender = e["gender"] == "M" ? Gender.male : Gender.female;
    Timestamp t = e["birthdate"] as Timestamp;
    DateTime birthdate = t.toDate();

    return PatientID(e["name"], gender, e["id"], birthdate);
  }).toList();

  return patients;
}

// TODO Create appointment (currently hardcoded) once schedule page has physician, pass uid on when click create appointment
void createAppointment(Map<String, dynamic> payload) async {
  debugPrint("createAppointment");

  final docRef = db.collection("Appointment");

  await docRef.add({
    "patient": "temp_value_patient", // TODO Haven't decided on how to do ids
    "practitioner": "temp_value",
    "appointmentType": payload["type"],
    "description": payload["description"],
    "created": DateTime.now(),
    "serviceCategory": "appointment",

    "scheduledTime": payload["scheduledTime"],
  }).then((value) => debugPrint(value.toString()),
      onError: (e) => debugPrint("Error occured: $e"));
}

// TODO Update Physician profile (currently hardcoded)
void updatePhysicianProfile(Map<String, dynamic> payload) async {
  debugPrint("updatePhysicianProfile");
  var docRef =
      db.collection("Practitioner").doc("5nsl8S4wXoeNLc6OzVgwJGRBmv62");

  await docRef.update({"description": payload["description"]});
}

// Retrieve patient profile given uid
Future<PatientID>? retrievePatientProfile(uid) async {
  debugPrint("retrievePatientsProfile");
  // Retrieve patient using corresponding uid
  Map<dynamic, dynamic> patientInfo = await db
      .collection("Patient")
      .doc(uid)
      .get()
      .then((DocumentSnapshot doc) {
    return doc.data() as Map<String, dynamic>;
  }, onError: (e) => debugPrint("Error getting document: $e"));

  // Parse information to be usable for model
  Gender gender = patientInfo["gender"] == "Male" ? Gender.male : Gender.female;
  Timestamp t = patientInfo["birthdate"] as Timestamp;
  DateTime birthdate = t.toDate();

  // Convert to Patient model and return
  PatientID patient = PatientID(
      patientInfo["name"]["text"], gender, patientInfo["id"], birthdate);

  return patient;
}

//TODO Retrieve physician profile (currently hardcoded))
Future<Physician> retrievePhysicianProfile(uid) async {
  debugPrint("retrievePhysicianProfile");
  // Get Physician
  uid = uid ??
      "5nsl8S4wXoeNLc6OzVgwJGRBmv62"; // TODO Temp for other hardcoded portions
  var docRef = db.collection("Practitioner").doc(uid);

  Map<dynamic, dynamic> list = await docRef.get().then((DocumentSnapshot doc) {
    return doc.data() as Map<String, dynamic>;
  }, onError: (e) => debugPrint("Error getting document: $e"));

  // Convert to Physician model and return
  Physician physician = Physician(
      list["name"]["text"],
      list["gender"] == "M" ? Gender.male : Gender.female,
      list["id"],
      list["description"]);

  return physician;
}

Future<Map<dynamic, dynamic>>? retrievePatientDetails(id) async {
  debugPrint("retrievePatientDetails");
  final patientRef = db.collection("Patient");
  final idQuery = patientRef.where('id', isEqualTo: id);

  Map<dynamic, dynamic> patientDetails = await db
      .collection("Patient")
      .where('id', isEqualTo: id)
      .get()
      .then((res) {
    return res.docs.single.data();
  });
  return patientDetails;
}

FirebaseFirestore getDatabase() {
  return db;
}
