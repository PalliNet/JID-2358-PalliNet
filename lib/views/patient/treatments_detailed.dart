import 'package:flutter/material.dart';

class TreatmentsDetailed extends StatelessWidget {
  const TreatmentsDetailed({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Detailed Treatments")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [Text("testing")],
      ),
    );
  }
}
