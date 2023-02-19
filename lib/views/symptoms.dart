import 'package:flutter/material.dart';
import 'package:pallinet/components/pain_diary.dart';

class SymptomsView extends StatelessWidget {
  const SymptomsView({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Symptoms")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [
          Padding(
              padding:
                  EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
              child: SizedBox(height: 300, child: PainDiary())),
        ],
      ),
    );
  }
}
