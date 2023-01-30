import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ElevatedButton(
              onPressed: () =>
                  {Navigator.pushNamed(context, "/patient/calendar")}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Background color
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.calendar_month_rounded,
                    color: Color.fromRGBO(64, 192, 251, 1),
                    size: 130,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Calendar',
                    style: TextStyle(fontSize: 30, color: Colors.black), 
                    textAlign: TextAlign.left,

                  )
                ],
              )),
        ],
      ),
    );
  }
}