import 'package:flutter/material.dart';

class Prescriptions extends StatelessWidget {
  const Prescriptions({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prescriptions"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ElevatedButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, "/prescriptionssummary")},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.medication,
                    color: Colors.purpleAccent,
                    size: 120,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Summary',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  )
                ],
              )),
          ElevatedButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, "/prescriptionsdetailedview")},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.library_books,
                    color: Colors.purpleAccent,
                    size: 100,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    '  Detailed View',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
