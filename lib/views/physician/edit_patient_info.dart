import 'package:flutter/material.dart';
import 'package:pallinet/components/patient_card.dart';
import 'package:pallinet/views/physician/patient_detailed_info.dart';

class EditPatientDetails extends StatefulWidget {
  const EditPatientDetails({super.key});

  @override
  State<EditPatientDetails> createState() => EditPatientDetailsState();
}

class EditPatientDetailsState extends State<EditPatientDetails> {
  // EditPatientDetailsState({super.key});
  // String sex = "";
  List<dynamic> patientDetails = ["", "", "", "", "", "", "", "", ""];

  Widget gap() => const Divider(
        height: 10,
        color: Colors.black,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Patient")),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const Text('Sex:\nMale',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          TextFormField(
            onChanged: (value) {
              patientDetails[0] = value;
              debugPrint(patientDetails.toString());
            },
            decoration: InputDecoration(labelText: "Input Sex"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter valid input";
              } else {
                return null;
              }
            },
          ),
          const Text('Age:\n87',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          TextFormField(
            onChanged: (value) {
              patientDetails[1] = value;
              debugPrint(patientDetails.toString());
            },
            decoration: InputDecoration(labelText: "Age"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter valid input";
              } else {
                return null;
              }
            },
          ),
          const Text('MRN:\n142617',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          TextFormField(
            onChanged: (value) {
              patientDetails[2] = value;
              debugPrint(patientDetails.toString());
            },
            decoration: InputDecoration(labelText: "MRN"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter valid input";
              } else {
                return null;
              }
            },
          ),
          const Text('DOB:\n12-17-1935',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          TextFormField(
            onChanged: (value) {
              patientDetails[3] = value;
              debugPrint(patientDetails.toString());
            },
            decoration: InputDecoration(labelText: "DOB"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter valid input";
              } else {
                return null;
              }
            },
          ),
          const Text('Pain Regiment:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          TextFormField(
            onChanged: (value) {
              patientDetails[4] = value;
              debugPrint(patientDetails.toString());
            },
            decoration: InputDecoration(labelText: "Pain Regiment"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter valid input";
              } else {
                return null;
              }
            },
          ),
          const Text('Last Visit:\n 1-28-23',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          TextFormField(
            onChanged: (value) {
              patientDetails[5] = value;
              debugPrint(patientDetails.toString());
            },
            decoration: InputDecoration(labelText: "Last Visit"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter valid input";
              } else {
                return null;
              }
            },
          ),
          const Text('Last 3 pain scores / recent trends:\n 80,90,100',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          TextFormField(
            onChanged: (value) {
              patientDetails[6] = value;
              debugPrint(patientDetails.toString());
            },
            decoration: InputDecoration(labelText: "Recent Scores"),
            validator: (value) {
              if (value!.isEmpty) {
                return "Enter valid input";
              } else {
                return null;
              }
            },
          ),
          const Text('Medical History(Clickable):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          const Text('Surgical History(Clickable):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          SizedBox(
            height: 100,
            width: 100,
            child: OutlinedButton(
              onPressed: () {
                // Navigator.pushNamed(context, "/physician/patient/edit_details");
              },
              child: const Text(
                "Save",
                style: TextStyle(fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
