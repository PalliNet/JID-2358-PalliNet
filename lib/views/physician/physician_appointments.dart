import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pallinet/components/appointment_card.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:pallinet/models/session_manager.dart';
class PhysicianAppointments extends StatefulWidget {
  const PhysicianAppointments({super.key});

  @override
  State<PhysicianAppointments> createState() => _PhysicianAppointmentsState();
}

class _PhysicianAppointmentsState extends State<PhysicianAppointments> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Expanded(flex: 8, child: FutureBuilder<List<dynamic>>(
        future: _prefs.getUid().then((uid) => retrieveAppointmentsPhysicians(uid)),
        builder: ((context, snapshot) {
          final list = snapshot.data == null
              ? []
              : (snapshot.data as List)
                  .map((e) => e as Map<String, dynamic>)
                  .toList();
          return Scaffold(
            appBar: AppBar(title: const Text("Appointments")),
            body: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                final data = list[index];
                Timestamp t = data["scheduledTimeStart"] as Timestamp;
                DateTime startTime = t.toDate();
                return AppointmentCard(
                  name: data["patient"],
                  date: startTime,
                  appointmentType: data["appointmentType"],
                  id: data["appointmentID"],
                );
              },
            ),
          );
         }),
        ),
      ),
      Expanded(flex: 2, child: ElevatedButton(
            onPressed: () => {Navigator.pushNamed(context, "/physician/appointments/new")},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, // Background color
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.schedule,
                  color: Colors.pink,
                  size: 40,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Schedule Appointment',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                )
              ],
            )),)
      ]
    );
  }
}
