import 'package:flutter/material.dart';

class TreatmentsCard extends StatelessWidget {
  const TreatmentsCard({
    super.key,
    required this.treatmentType,
    required this.schedule,
    required this.durationToComplete,
  });

  final String schedule;
  final String treatmentType;
  final String durationToComplete;

  @override
  Widget build(BuildContext context) {
    Widget gap() => const SizedBox(height: 10);

    return SizedBox(
        width: double.infinity,
        child: Card(
            child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      treatmentType,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(schedule),
                    gap(),
                    Text(durationToComplete),
                  ],
                ))));
  }
}
