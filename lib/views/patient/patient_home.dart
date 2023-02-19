import 'package:flutter/material.dart';
import 'package:pallinet/components/appointments.dart';
import 'package:pallinet/components/symptoms.dart';
import 'package:pallinet/components/pain_diary.dart';
import 'package:pallinet/components/prescriptions.dart';
import 'package:pallinet/components/treatments.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:pallinet/models/patient_model.dart';
import 'package:pallinet/models/session_manager.dart';
import 'package:pallinet/components/calendar_card.dart';
import 'package:pallinet/components/eol_plans.dart';

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
        Widget gap() => const SizedBox(height: 30);

        String patientName = snapshot.data == null
            ? "Loading..."
            : (snapshot.data as PatientID).name;
        return Scaffold(
          appBar: AppBar(title: Text(patientName)),
          body: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              ElevatedButton(
                  onPressed: () =>
                      {Navigator.pushNamed(context, "/patient/calendar")},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.calendar_month_rounded,
                        color: Color.fromRGBO(64, 192, 251, 1),
                        size: 130,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Calendar',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                        textAlign: TextAlign.left,
                      )
                    ],
                  )),
              gap(),
              // const PainDiary(),
              ElevatedButton(
                  onPressed: () =>
                      {Navigator.pushNamed(context, "/patient/appointments")},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.schedule,
                        color: Color.fromRGBO(64, 192, 251, 1),
                        size: 110,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'Appointments',
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      )
                    ],
                  )),
              gap(),
              ElevatedButton(
                  onPressed: () =>
                      {Navigator.pushNamed(context, "/patient/treatments")},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.health_and_safety_outlined,
                        color: Colors.red,
                        size: 100,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Treatments',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      )
                    ],
                  )),
              gap(),
              ElevatedButton(
                  onPressed: () =>
                      {Navigator.pushNamed(context, "/patient/medications")},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.medication,
                        color: Colors.purpleAccent,
                        size: 120,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Summary',
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      )
                    ],
                  )),
              gap(),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.pushNamed(
                            context, '/patient/home/endoflifeplans')
                      },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Background color
                  ),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.list_alt_sharp,
                        color: Colors.redAccent,
                        size: 120,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'End of Life Plans',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )
                    ],
                  )),
            ],
          ),
        );
      }),
    );
  }
}
