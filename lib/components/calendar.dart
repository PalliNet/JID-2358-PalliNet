import 'package:flutter/material.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detailed View of Calendar")),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: const [Text("Calandar View")],
      ),
    );
  }
}
