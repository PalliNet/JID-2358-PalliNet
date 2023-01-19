import 'package:flutter/material.dart';

class PhysicianAppointments extends StatelessWidget {
  const PhysicianAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Dr. Totally Real Doctor")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [Text("Appointments")],
      ),
    );
  }
}
