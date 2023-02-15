import 'package:flutter/material.dart';
import 'package:pallinet/firestore/firestore.dart';

class PhysicianHome extends StatelessWidget {
  const PhysicianHome({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: const Text("Dr. Totally Real Doctor")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, "/patients")},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.assignment_ind,
                    color: Colors.pink,
                    size: 120,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Patients',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  )
                ],
              )),
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, "/physician/appointments")},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.schedule,
                    color: Colors.pink,
                    size: 120,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Appointments',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  )
                ],
              )),
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, "/physician/profile")},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.settings,
                    color: Colors.pink,
                    size: 120,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
