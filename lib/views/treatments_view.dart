import 'package:flutter/material.dart';
import 'package:pallinet/components/loading.dart';
import 'package:pallinet/components/treatments_card.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:pallinet/models/treatment_model.dart';
import 'package:pallinet/models/session_manager.dart';

class Treatments extends StatefulWidget {
  const Treatments({super.key});

  @override
  State<Treatments> createState() => _TreatmentsState();
}

class _TreatmentsState extends State<Treatments> {
  late final SessionManager _prefs;

  @override
  void initState() {
    _prefs = SessionManager();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Treatment>?>(
        future: _prefs.getUid().then((uid) => retrieveTreatments(uid)),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            final treatments = snapshot.data as List;
            return Scaffold(
              appBar: AppBar(title: const Text("Treatments")),
              body: ListView.builder(
                itemCount: treatments.length,
                itemBuilder: (BuildContext context, int index) {
                  Treatment data = treatments[index];
                  return TreatmentsCard(
                    treatmentType: data.treatmentType,
                    schedule: data.schedule,
                    durationToComplete: data.durationToComplete,
                    detailedInstructions: data.detailedInstructions,
                  );
                },
              ),
            );
          } else {
            return const LoadingScreen("Loading treatments");
          }
        }));
  }
}
