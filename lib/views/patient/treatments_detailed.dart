import 'package:flutter/material.dart';

class TreatmentsDetailed extends StatelessWidget {
  final String treatmentType;
  final String schedule;
  final String durationToComplete;
  final String detailedInstructions;

  const TreatmentsDetailed({
    Key? key,
    required this.treatmentType,
    required this.schedule,
    required this.durationToComplete,
    required this.detailedInstructions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$treatmentType Details',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              treatmentType,
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 16),
            const Divider(),
            const Text(
              'Visitation Time:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              schedule,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const Text(
              'Duration:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              durationToComplete,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const Text(
              'Detailed Instructions:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              detailedInstructions,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
