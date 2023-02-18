import 'package:flutter/material.dart';

// ignore: camel_case_types
class treatmentsDetailed extends StatelessWidget {
  const treatmentsDetailed({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Detailed Treatments")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [Text("testing")],
      ),
    );
  }
}
