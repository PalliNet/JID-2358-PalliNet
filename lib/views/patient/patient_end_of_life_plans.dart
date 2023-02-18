import 'package:flutter/material.dart';
import 'package:pallinet/components/loading.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:pallinet/models/patient_model.dart';

class EndOfLifePlansView extends StatelessWidget {
  const EndOfLifePlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('End of Life Plans')),
    );
  }
}
