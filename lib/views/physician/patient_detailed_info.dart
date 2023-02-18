import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pallinet/components/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:age_calculator/age_calculator.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({super.key});
  Widget gap() => const Divider(
        height: 10,
        color: Colors.black,
      );

  @override
  Widget build(BuildContext context) {
    debugPrint(ModalRoute.of(context)?.settings.arguments.toString());
    final arguments = ModalRoute.of(context)?.settings.arguments ?? '';
    debugPrint(arguments.toString());
    return FutureBuilder<Map<dynamic, dynamic>>(
      future: retrievePatientDetails(arguments),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> datas = snapshot.data as Map<String, dynamic>;
          Timestamp t;
          t = datas["birthdate"] as Timestamp;
          DateTime birthdate = t.toDate();
          return Scaffold(
              appBar: AppBar(title: Text(datas['name']['text'])),
              body: ListView(
                children: [
                  Text('Gender: ${datas['gender']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  gap(),
                  Text('DOB: ${DateFormat('MM-dd-yyyy').format(birthdate)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  gap(),
                  Text(
                      'Age: ${((DateTime.now().difference(birthdate).inDays) ~/ 365.0)} years old',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  gap(),
                  Text('MRN: ${datas['maritalStatus']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  gap(),
                  Text('Pain Regiment: ${datas['maritalStatus']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  gap(),
                  Text('Last 3 Pain Scores: ${datas['maritalStatus']}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  gap(),
                  TextButton(
                      onPressed: () {}, child: const Text('Medical History')),
                  gap(),
                  TextButton(
                      onPressed: () {}, child: const Text('Surgical History')),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, "/physician/patient/edit_details",
                            arguments: arguments);
                      },
                      child: const Text(
                        "Edit Details",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  )
                ],
              ));
        } else {
          return const LoadingScreen('Loading Patient Details');
        }
      }),
    );
  }
}
