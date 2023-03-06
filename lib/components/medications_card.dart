import 'package:flutter/material.dart';
import 'package:pallinet/views/patient/medications_detailed.dart';

class MedicationCard extends StatelessWidget {
  final String medication;
  final List<String> brands;
  final String dosage;
  final String orderDetail;
  final String precautions;

  const MedicationCard({
    Key? key,
    required this.medication,
    required this.brands,
    required this.dosage,
    required this.orderDetail,
    required this.precautions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget gap() => const SizedBox(height: 10);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MedicationsDetailed(
              medication: medication,
              brands: brands,
              dosage: dosage,
              orderDetail: orderDetail,
              precautions: precautions,
            ),
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  medication,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "(${brands.join(",")}), $dosage",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                gap(),
                Text(orderDetail),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
