// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ElevatedButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, "/patient/appointments")},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.schedule,
                    color: Color.fromRGBO(64, 192, 251, 1),
                    size: 110,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Appointments',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
