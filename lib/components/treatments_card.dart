import 'package:flutter/material.dart';

class TreatmentsCard extends StatelessWidget {
  const TreatmentsCard({
    super.key,
    required this.typetreatment,
    required this.schedule,
    required this.durationToComplete,
  });

  final String schedule;
  final String typetreatment;
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
                      typetreatment,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text(schedule),
                    gap(),
                    Text(durationToComplete),
                  ],
                ))));
  }
}
