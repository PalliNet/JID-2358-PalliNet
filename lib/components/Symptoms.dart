import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  const Symptoms({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Symptoms"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ElevatedButton(
              onPressed: () => {Navigator.pushNamed(context, "/symptoms")},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.personal_injury,
                    color: Colors.redAccent,
                    size: 120,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Symptoms',
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
