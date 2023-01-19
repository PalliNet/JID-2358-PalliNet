import 'package:flutter/material.dart';
import 'package:pallinet/components/patient_card.dart';

class PatientList extends StatelessWidget {
  const PatientList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Patients")),
      body: ListView(
        children: <PatientCard>[
          PatientCard(
            name: "John Smith",
            mrn: "142617",
            age: 87,
            sex: "M",
            birthdate: DateTime(1935, 12, 17),
          ),
          PatientCard(
            name: "Jason Guo",
            mrn: "491853",
            age: 21,
            sex: "M",
            birthdate: DateTime(2001, 12, 17),
          ),
          PatientCard(
            name: "Temp1",
            mrn: "123151",
            age: 21,
            sex: "M",
            birthdate: DateTime(2001, 12, 17),
          ),
          PatientCard(
            name: "Temp2",
            mrn: "643624",
            age: 21,
            sex: "M",
            birthdate: DateTime(2001, 12, 17),
          ),
          PatientCard(
            name: "Temp3",
            mrn: "123464",
            age: 21,
            sex: "M",
            birthdate: DateTime(2001, 12, 17),
          ),
          PatientCard(
            name: "Temp4",
            mrn: "876945",
            age: 21,
            sex: "M",
            birthdate: DateTime(2001, 12, 17),
          ),
          PatientCard(
            name: "Temp5",
            mrn: "356925",
            age: 21,
            sex: "M",
            birthdate: DateTime(2001, 12, 17),
          ),
          PatientCard(
            name: "Temp6",
            mrn: "245725",
            age: 21,
            sex: "M",
            birthdate: DateTime(2001, 12, 17),
          ),
          PatientCard(
            name: "Temp7",
            mrn: "345608",
            age: 21,
            sex: "M",
            birthdate: DateTime(2001, 12, 17),
          ),
          PatientCard(
            name: "Temp8",
            mrn: "985676",
            age: 21,
            sex: "M",
            birthdate: DateTime(2001, 12, 17),
          ),
          PatientCard(
            name: "Temp9",
            mrn: "452324",
            age: 21,
            sex: "M",
            birthdate: DateTime(2001, 12, 17),
          ),
          PatientCard(
            name: "Temp10",
            mrn: "123464",
            age: 21,
            sex: "M",
            birthdate: DateTime(2001, 12, 17),
          ),
        ],
      ),
    );
  }
}
