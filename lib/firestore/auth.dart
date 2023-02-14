import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firestore.dart';

Future<bool> createPatient(payload) async {
  List<String> birthdate = payload["birthdate"].split("/");

  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: payload['email'],
      password: payload['password'],
    );
    String uid = credential.user!.uid;

    // Create patient
    db.collection("Patient").doc(uid).set({
      "active": true,
      "birthdate": DateTime(int.parse(birthdate[2]), int.parse(birthdate[0]), int.parse(birthdate[1])),
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
      db
          .collection("Patient")
          .doc(uid)
          .collection("ContactPoint")
          .add({"system": "phone", "use": payload["type"].value, "value": payload["phoneNumber"]});
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

Future<bool> signIn(payload) async {
  try {
    final credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: payload["email"], password: payload["password"]);
    debugPrint("Signed in: $credential.user!.uid");
    return true;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }

  return false;
}
