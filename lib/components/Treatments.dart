// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Treatments extends StatelessWidget {
  const Treatments({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Treatments"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ElevatedButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, "/treatmentsrecommended")},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.health_and_safety_outlined,
                    color: Colors.red,
                    size: 100,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Reccomended',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  )
                ],
              )),
          ElevatedButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, "/treatmentsdetailed")},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.healing,
                    color: Colors.red,
                    size: 100,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Detailed View',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
