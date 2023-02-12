import 'package:flutter/material.dart';
import 'package:pallinet/components/patient_card.dart';

class PatientDetails extends StatelessWidget {
  const PatientDetails({super.key});
  Widget gap() => const Divider(
        height: 10,
        color: Colors.black,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("John Smith")),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const Text('Sex:\nMale',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          const Text('Age:\n87',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          const Text('MRN:\n142617',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          const Text('DOB:\n12-17-1935',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          const Text('Pain Regiment:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          const Text('Last Visit:\n 1-28-23',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
          const Text('Last 3 pain scores / recent trends:\n 80,90,100',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          gap(),
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
                Navigator.pushNamed(context, "/physician/patient/edit_details");
              },
              child: const Text(
                "Edit Details",
                style: TextStyle(fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
