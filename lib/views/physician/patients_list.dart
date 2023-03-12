import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pallinet/components/patient_card.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:pallinet/models/session_manager.dart';

class PatientList extends StatefulWidget {
  const PatientList({super.key});

  @override
  State<PatientList> createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  // final test = retrievePatients();
  late final SessionManager _prefs;

  @override
  void initState() {
    _prefs = SessionManager();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  //TODO create retrieve id method in firestore to get physician ID and then put into retrievePatients()


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: retrievePatients(),
      builder: ((context, snapshot) {
        final list = snapshot.data == null
            ? []
            : (snapshot.data as List)
                .map((e) => e as Map<String, dynamic>)
                .toList();
        return Scaffold(
          appBar: AppBar(title: const Text("Patients")),
          body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              final data = list[index];
              Timestamp t = data["birthdate"] as Timestamp;
              DateTime birthdate = t.toDate();
              return PatientCard(
                name: data["name"],
                id: data["id"],
                age: AgeCalculator.age(birthdate).years,
                sex: data["gender"],
                birthdate: birthdate,
              );
            },
          ),
        );
      }),
    );
  }
}
