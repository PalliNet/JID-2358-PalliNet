import 'package:flutter/material.dart';

class PrescriptionsSummary extends StatelessWidget {
  const PrescriptionsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Summary of Prescriptions")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [Text("Tylenol \nIbuprofen \nCodene")],
      ),
    );
  }
}
