// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Appointments extends StatelessWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appointments"),
        automaticallyImplyLeading: false,
      ),
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
                    size: 60,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Upcoming Appointments',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              )),
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
                    size: 60,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Upcoming Appointments',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
