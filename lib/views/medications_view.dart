import 'package:flutter/material.dart';
import 'package:pallinet/components/loading.dart';
import 'package:pallinet/components/medications_card.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:pallinet/models/medication_model.dart';
import 'package:pallinet/models/session_manager.dart';

class Medications extends StatefulWidget {
  const Medications({super.key});

  @override
  State<Medications> createState() => _MedicationsState();
}

class _MedicationsState extends State<Medications> {
  late final SessionManager _prefs;

  @override
  void initState() {
    _prefs = SessionManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Medication>?>(
        future: _prefs.getUid().then((uid) => retrieveMedications(uid)),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final medications = snapshot.data as List;
            return Scaffold(
              appBar: AppBar(title: const Text("Medications")),
              body: ListView.builder(
                itemCount: medications.length,
                itemBuilder: (BuildContext context, int index) {
                  Medication data = medications[index];
                  return MedicationCard(
                    medication: data.medication,
                    brands: data.brands,
                    orderDetail: data.orderDetail,
                    dosage: data.dosage,
                    precautions: data.precautions,
                  );
                },
              ),
            );
          } else {
            return const LoadingScreen("Loading medications");
          }
        }));
  }
}
