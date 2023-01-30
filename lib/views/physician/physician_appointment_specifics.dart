import 'package:flutter/material.dart';

class PhysicianAppointmentSpecifics extends StatelessWidget {
  const PhysicianAppointmentSpecifics({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Detailed View of Appointment")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [Text("blah blah")],
      ),
    );
  }
}
