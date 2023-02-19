import 'package:flutter/material.dart';

class MedicationCard extends StatelessWidget {
  const MedicationCard({
    super.key,
    required this.medication,
    required this.brands,
    required this.orderDetail,
    required this.dosage,
  });

  final String medication;
  final List<String> brands;
  final String orderDetail;
  final String dosage;

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
                      medication,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Text("(${brands.join(",")}), $dosage",
                        style: Theme.of(context).textTheme.subtitle2),
                    gap(),
                    Text(orderDetail),
                  ],
                ))));
  }
}
