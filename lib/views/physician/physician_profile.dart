import 'package:age_calculator/age_calculator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pallinet/components/patient_card.dart';
import 'package:pallinet/constants.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:pallinet/models/patient_model.dart';
import 'package:pallinet/models/physician_model.dart';

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

  String? desc = "gkyhuiadfs";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Physician> (
      future: retrievePhysicianProfile(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          Physician? physData = snapshot.data;
          desc = physData!.description;
          // debugPrint("4");
          // debugPrint(desc);
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
                  'Update profile',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                gap(),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 3,
                  initialValue: desc,
                  onSaved: (value) => {desc = value},
                  decoration: const InputDecoration(
                    hintText: 'Profile Description',
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12)
                      ),
                    ),
                  ),
                ),
                gap(),
                ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.save();
                      Map<String, dynamic> payload = {
                        "description": desc,
                      };
                      // debugPrint("3");
                      // debugPrint(desc);
                      updatePhysicianProfile(payload);
                      Navigator.pushNamed(context, "/physician/home");
                    },
                    child: const Text("Change Profile")
                )
              ],
            ),
          ),
        );
          } else {
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      "Loading Profile",
                    ),
                    SizedBox(height: 50),
                    CircularProgressIndicator(
                      semanticsLabel: "Loading Profile",
                    ),
                  ],
                ),
              ),
            );
          }
      }),
    );
  }

  Widget gap() => const SizedBox(height: 16);
}
