import 'package:flutter/material.dart';
import 'package:pallinet/components/pain_diary.dart';

class PatientList extends StatelessWidget {
  const PatientList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Patients")),
      body: ListView(
        children: const [Text("OwO, this is the patients")],
      ),
    );
  }
}
