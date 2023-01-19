import 'package:flutter/material.dart';
import 'package:pallinet/components/patient_card.dart';

class PatientList extends StatelessWidget {
  const PatientList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Patients")),
      body: ListView(
        children: <PatientCard>[
          PatientCard(
            name: "John Smith",
            mrn: "142617",
            age: 87,
            sex: "M",
            birthdate: DateTime(2001, 12, 17),
          )
        ],
      ),
    );
  }
}
