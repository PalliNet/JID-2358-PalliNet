import 'package:flutter/material.dart';
import 'package:pallinet/components/Appointments.dart';
import 'package:pallinet/components/Messages.dart';
import 'package:pallinet/components/PainDiary.dart';
import 'package:pallinet/components/Treatments.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("John Smith")),
      body: ListView(
        children: const [
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: SizedBox(height: 300, child: PainDiary())),
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: SizedBox(height: 300, child: Appointments())),
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: SizedBox(height: 300, child: Messages())),
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: SizedBox(height: 300, child: Treatments()))
        ],
      ),
    );
  }
}
