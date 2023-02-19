import 'package:flutter/material.dart';

class Medications extends StatelessWidget {
  const Medications({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Summary of Prescriptions")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [Text("Tylenol \nIbuprofen \nCodene")],
      ),
    );
  }
}
