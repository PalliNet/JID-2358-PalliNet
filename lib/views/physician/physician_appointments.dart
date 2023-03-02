import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pallinet/components/appointment_card.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:pallinet/models/session_manager.dart';
class PhysicianAppointments extends StatelessWidget {
  const PhysicianAppointments({super.key});
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: retrieveAppointmentsPhysicians(),
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
              Timestamp t = data["scheduledTimeStart"] as Timestamp;
              DateTime startTime = t.toDate();
              return AppointmentCard(
                name: data["patient"],
                date: startTime,
              );
            },
          ),
        );
      }),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     // double screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(title: const Text("Appointments")),
//       body: ListView(
//         padding: const EdgeInsets.all(8),
//         children: [
//           const Text(
//             "Upcoming Appointments",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           AppointmentCard(name: "Kenny Hoang", date: DateTime(2023, 2, 21), time: "12:30PM"),
//           const Padding(padding: EdgeInsets.all(16.0)),
//           const Text(
//             "Past Appointments",
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//           ),
//           AppointmentCard(name: "Jenny Ang", date: DateTime(2022, 12, 25), time: "1:30PM"),
//           const Padding(padding: EdgeInsets.all(16.0)),
//           ElevatedButton(
//               onPressed: () => {Navigator.pushNamed(context, "/physician/appointments/new")},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white, // Background color
//               ),
//               child: Row(
//                 children: const [
//                   Icon(
//                     Icons.schedule,
//                     color: Colors.pink,
//                     size: 40,
//                   ),
//                   SizedBox(
//                     width: 20,
//                   ),
//                   Text(
//                     'Schedule Appointment',
//                     style: TextStyle(fontSize: 15, color: Colors.black),
//                   )
//                 ],
//               )),
//         ],
//       ),
//     );
//   }
// }
