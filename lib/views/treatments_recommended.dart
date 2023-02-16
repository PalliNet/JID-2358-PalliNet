import 'package:flutter/material.dart';

// ignore: camel_case_types
class treatmentsRecommended extends StatelessWidget {
  const treatmentsRecommended({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Reccomended Treatments")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [Text("testing")],
      ),
    );
  }
}// TODO Implement this library.