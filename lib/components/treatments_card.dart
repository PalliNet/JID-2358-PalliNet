import 'package:flutter/material.dart';
import 'package:pallinet/views/patient/treatments_detailed.dart';

class TreatmentsCard extends StatelessWidget {
  const TreatmentsCard({
    super.key,
    required this.treatmentType,
    required this.schedule,
    required this.durationToComplete,
    required this.detailedInstructions,
  });

  final String schedule;
  final String treatmentType;
  final String durationToComplete;
  final String detailedInstructions;

  @override
  Widget build(BuildContext context) {
    Widget gap() => const SizedBox(height: 10);
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TreatmentsDetailed(
                      treatmentType: treatmentType,
                      schedule: schedule,
                      durationToComplete: durationToComplete,
                      detailedInstructions: detailedInstructions,
                    )),
          );
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
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
            ),
          ),
        ),
      ),
    );
  }
}
