import 'package:flutter/material.dart';

class PrescriptionsDetailedView extends StatelessWidget {
  const PrescriptionsDetailedView({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Detailed View of Prescriptions")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [Text("blah blah")],
      ),
    );
  }
}
