import 'package:flutter/material.dart';
import 'package:pallinet/components/appointments.dart';
import 'package:pallinet/components/messages.dart';
import 'package:pallinet/components/pain_diary.dart';
import 'package:pallinet/components/prescriptions.dart';
import 'package:pallinet/components/treatments.dart';

class PatientHome extends StatelessWidget {
  const PatientHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("John Smith")),
      body: ListView(
        children: const [
          Padding(
              padding:
                  EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
              child: SizedBox(height: 300, child: PainDiary())),
          Padding(
              padding:
                  EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
              child: SizedBox(height: 140, child: Appointments())),
          Padding(
              padding:
                  EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
              child: SizedBox(height: 300, child: Messages())),
          Padding(
              padding:
                  EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
              child: SizedBox(height: 300, child: Treatments())),
          Padding(
              padding:
                  EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
              child: SizedBox(height: 300, child: Prescriptions()))
        ],
      ),
      
    );
  }
}
