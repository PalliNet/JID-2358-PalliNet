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

Future<List<PatientID>>? retrievePatients2() async {
  debugPrint("Retrieve patients");

  Map<dynamic, dynamic> list = await db
      .collection("Practitioner")
      .doc("ORVKtlLSLSovmRfxxPq5")
      .get()
      .then((DocumentSnapshot doc) {
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

void createAppointment(Map<String, dynamic> payload) async {
  debugPrint("Create appointment");
  debugPrint(payload.toString());

  final appointmentsRef = db.collection("Appointment");

  await appointmentsRef.add({
    "appointmentType": payload["type"],
    "description": payload["description"],
    "created": DateTime.now(),
    "serviceCategory": "appointment",
  }).then((value) => debugPrint(value.toString()),
      onError: (e) => debugPrint("Error occured: $e"));

  Map<dynamic, dynamic> list = await db
      .collection("Practitioner")
      .doc("ORVKtlLSLSovmRfxxPq5")
      .get()
      .then((DocumentSnapshot doc) {
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

Future<bool> createPatient(payload) async {
  List<String> birthdate = payload["birthdate"].split("/");

  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: payload['email'],
      password: payload['password'],
    );
    String uid = credential.user!.uid;

    // Create patient
    db.collection("Patient").doc(uid).set({
      "active": true,
      "birthdate": DateTime(int.parse(birthdate[2]), int.parse(birthdate[0]),
          int.parse(birthdate[1])),
      "deceasedBoolean": false,
      "gender": payload["gender"].value,
      "id": 1111111, //TODO How are we doing ids?
      "name": {
        "family": payload["lastName"],
        "given": payload["firstName"],
        "text": payload["firstName"] + " " + payload["lastName"],
      }
    });

    // Add phone number if included
    if (payload["phoneNumber"] != null) {
      db.collection("Patient").doc(uid).collection("ContactPoint").add({
        "system": "phone",
        "use": payload["type"].value,
        "value": payload["phoneNumber"]
      });
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      debugPrint('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      debugPrint('The account already exists for that email.');
    }
    return false;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }

  return true;
}

void updatePhysicianProfile(Map<String, dynamic> payload) async {
  // debugPrint("Update physician");
  // docRef = db.collection("Practitioner").doc(id);

  await db
      .collection("Practitioner")
      .doc("ORVKtlLSLSovmRfxxPq5")
      .update({"description": payload["description"]});
}

Future<Physician>? retrievePhysicianProfile() async {
  // debugPrint("Update physician");

  Map<dynamic, dynamic> list = await db
      .collection("Practitioner")
      .doc("ORVKtlLSLSovmRfxxPq5")
      .get()
      .then((DocumentSnapshot doc) {
    return doc.data() as Map<String, dynamic>;
  }, onError: (e) => debugPrint("Error getting document: $e"));

  // debugPrint(list.toString());
  // debugPrint("Success");
  Physician physician = Physician(
      list["name"],
      list["gender"] == "M" ? Gender.male : Gender.female,
      list["id"],
      list["description"]);

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
