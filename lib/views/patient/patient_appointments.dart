import 'package:flutter/material.dart';
import 'package:pallinet/components/appointment_card.dart';

class PatientAppointments extends StatelessWidget {
  const PatientAppointments({super.key});
@override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Appointments")),
      body: 
      ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const Text(
            "Upcoming Appointments", 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          AppointmentCard(
            name: "Dr. Totally Real Doctor",
            date: DateTime(2023, 2,  12),
            time: "12:30PM"
            ),
          const Padding(padding: EdgeInsets.all(16.0)),
          const Text(
            "Past Appointments", 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          AppointmentCard(
            name: "Dr. Lanyard",
            date: DateTime(2022, 12,  25),
            time: "1:30PM"
          ),
          const Padding(padding: EdgeInsets.all(16.0)),
          ElevatedButton(
              onPressed: () => {debugPrint('schedule tapped')},
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
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
