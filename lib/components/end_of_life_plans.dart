import 'package:flutter/material.dart';

class EndOfLifePlans extends StatelessWidget {
  const EndOfLifePlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('End of Life Plans'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ElevatedButton(
              onPressed: () => {
                    Navigator.pushNamed(context, '/patient/home/endoflifeplans')
                  },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.list_alt_sharp,
                    color: Colors.redAccent,
                    size: 120,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'End of Life Plans',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
