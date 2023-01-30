import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pallinet/components/patient_card.dart';
import 'package:pallinet/constants.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:pallinet/models/patient_model.dart';

class CreateAppointment extends StatelessWidget {
  const CreateAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Create Appointment')),
        body: const Padding(padding: EdgeInsets.all(16.0), child: AppointmentContent()));
  }
}

class AppointmentContent extends StatefulWidget {
  const AppointmentContent({Key? key}) : super(key: key);

  @override
  State<AppointmentContent> createState() => AppointmentContentState();
}

class AppointmentContentState extends State<AppointmentContent> {
  bool isPasswordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  PatientID? patient;
  List? practitioners = [];
  DateTime? date = DateTime.now();
  String? desc = "";
  ServiceType? serviceType;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PatientID>>(
      future: retrievePatients2(),
      builder: ((context, snapshot) {
        List<PatientID> list = snapshot.data == null ? [] : snapshot.data as List<PatientID>;
        return Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                gap(),
                gap(),
                DropdownButtonFormField(
                    decoration: const InputDecoration(
                      hintText: 'Patient',
                      prefixIcon: Icon(Icons.person),
                    ),
                    items: list.map((e) {
                      return DropdownMenuItem<PatientID>(value: e, child: Text(e.name));
                    }).toList(),
                    onChanged: (PatientID? value) {
                      debugPrint("temmp");
                    },
                    onSaved: (value) => {patient = value},
                    value: patient),
                gap(),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Practitioner(s)',
                    prefixIcon: Icon(Icons.group_add),
                  ),
                ),
                gap(),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 3,
                  onSaved: (value) => {desc = value},
                  decoration: const InputDecoration(
                    hintText: 'Notes',
                    prefixIcon: Icon(Icons.description),
                  ),
                ),
                DropdownButtonFormField(
                  items: ServiceType.values.map((e) {
                    return DropdownMenuItem<ServiceType>(
                      value: e,
                      child: Text(e.value),
                    );
                  }).toList(),
                  hint: const Text("Visit Type"),
                  onChanged: (ServiceType? value) {
                    debugPrint(value.toString());
                  },
                  onSaved: (value) => {serviceType = value},
                  value: serviceType,
                ),
                gap(),
                ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.save();
                      debugPrint('Form Information');
                      debugPrint('Patient: $patient');
                      debugPrint('Practioners: $practitioners');
                      debugPrint('Description: $desc');
                      debugPrint('Service Type: $serviceType');
                      Map<String, dynamic> payload = {
                        "patient": patient,
                        "practitioners": practitioners,
                        "description": desc,
                        "type": serviceType?.value,
                      };
                      createAppointment(payload);
                      // debugPrint(_formKey.currentState.toString());
                    },
                    child: const Text("Create Appointment"))
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget gap() => const SizedBox(height: 16);
}
