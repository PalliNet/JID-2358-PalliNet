import 'package:flutter/material.dart';
import 'package:pallinet/components/Symptoms.dart';
import 'package:pallinet/components/appointments.dart';
import 'package:pallinet/components/messages.dart';
import 'package:pallinet/components/pain_diary.dart';
import 'package:pallinet/components/prescriptions.dart';
import 'package:pallinet/components/treatments.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:pallinet/models/patient_model.dart';
import 'package:pallinet/models/session_manager.dart';
import 'package:pallinet/views/calendar_card.dart';

class PatientHome extends StatefulWidget {
  const PatientHome({super.key});

  @override
  State<PatientHome> createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  late final SessionManager _prefs;

  @override
  void initState() {
    _prefs = SessionManager();
    super.initState();
  }

  @override
  void dispose() {
    _prefs.clearAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PatientID?>(
      future: _prefs.getUid().then((uid) => retrievePatientProfile(uid)),
      builder: ((context, snapshot) {
        String patientName = snapshot.data == null ? "Loading..." : (snapshot.data as PatientID).name;
        return Scaffold(
          appBar: AppBar(title: Text(patientName)),
          body: ListView(
            children: const [
              Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
                  child: SizedBox(height: 150, child: Calendar())),
              Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
                  child: SizedBox(height: 300, child: Symptoms())),
              Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
                  child: SizedBox(height: 300, child: PainDiary())),
              Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
                  child: SizedBox(height: 140, child: Appointments())),
              Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
                  child: SizedBox(height: 300, child: Messages())),
              Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
                  child: SizedBox(height: 300, child: Treatments())),
              Padding(
                  padding: EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
                  child: SizedBox(height: 300, child: Prescriptions()))
            ],
          ),
        );
      }),
    );
  }
}
