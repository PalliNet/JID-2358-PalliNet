import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pallinet/components/patient_card.dart';
import 'package:pallinet/constants.dart';
import 'package:pallinet/firestore/firestore.dart';

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

  String patient = "";
  List practitioners = [];
  DateTime date = DateTime.now();
  String desc = "";
  ServiceType? serviceType;

  @override
  Widget build(BuildContext context) {
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
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Patient',
                prefixIcon: Icon(Icons.person),
              ),
            ),
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
              decoration: const InputDecoration(
                hintText: 'Notes',
                prefixIcon: Icon(Icons.description),
              ),
            ),
            DropdownButton(
              items: ServiceType.values.map((e) {
                return DropdownMenuItem<ServiceType>(
                  value: e,
                  child: Text(e.value),
                );
              }).toList(),
              hint: const Text("Visit Type"),
              onChanged: (ServiceType? value) {
                debugPrint(value.toString());
                setState(() {
                  serviceType = value!;
                });
              },
              value: serviceType,
            )
          ],
        ),
      ),
    );
  }

  Widget gap() => const SizedBox(height: 16);
}
