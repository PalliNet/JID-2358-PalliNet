import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pallinet/components/patient_card.dart';
import 'package:pallinet/constants.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:pallinet/models/patient_model.dart';

class PhysicianProfile extends StatelessWidget {
  const PhysicianProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Edit Physican Profile')),
        body: const Padding(padding: EdgeInsets.all(16.0), child: ProfileContent()));
  }
}

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  State<ProfileContent> createState() => ProfileContentState();
}

class ProfileContentState extends State<ProfileContent> {
  bool isPasswordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? desc = "";

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
            const Text(
              'Change your profile description here',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            gap(),
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 3,
              onSaved: (value) => {desc = value},
              decoration: const InputDecoration(
                hintText: 'Profile Description',
                prefixIcon: Icon(Icons.description),
              ),
            ),
            gap(),
            ElevatedButton(
                onPressed: () {
                  _formKey.currentState?.save();
                  Map<String, dynamic> payload = {
                    "description": desc,
                  };
                  updatePhysicianProfile(payload);
                  Navigator.pushNamed(context, "/physician/home");
                },
                child: const Text("Change Profile"))

          ],
        ),
      ),
    );
  }

  Widget gap() => const SizedBox(height: 16);
}
