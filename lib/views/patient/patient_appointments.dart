import 'package:flutter/material.dart';

class PatientAppointments extends StatelessWidget {
  const PatientAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("John Smith")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [Text("Appointments")],
      ),
    );
  }
}
