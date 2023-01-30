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
        children: [
          Padding(
              padding:
                  EdgeInsets.only(bottom: 10, top: 10, right: 20, left: 20),
              child: SizedBox(height: 300, child: PainDiary())),
          // ElevatedButton(
          //     onPressed: () => {Navigator.pushNamed(context, "/patients")},
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.white, // Background color
          //     ),
          //     child: Row(
          //       children: const [
          //         Icon(
          //           Icons.assignment_ind,
          //           color: Colors.pink,
          //           size: 120,
          //         ),
          //         SizedBox(
          //           width: 20,
          //         ),
          //         Text(
          //           'Patients',
          //           style: TextStyle(fontSize: 30, color: Colors.black),
          //         )
          //       ],
          //     )),
          // ElevatedButton(
          //     onPressed: () => {Navigator.pushNamed(context, "/appointments")},
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: Colors.white, // Background color
          //     ),
          //     child: Row(
          //       children: const [
          //         Icon(
          //           Icons.schedule,
          //           color: Colors.pink,
          //           size: 120,
          //         ),
          //         SizedBox(
          //           width: 20,
          //         ),
          //         Text(
          //           'Appointments',
          //           style: TextStyle(fontSize: 30, color: Colors.black),
          //         )
          //       ],
          //     ))
        ],
      ),
    );
  }
}
