import 'package:flutter/material.dart';
import 'package:pallinet/components/loading.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:pallinet/models/physician_model.dart';

class PhysicianProfile extends StatelessWidget {
  const PhysicianProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProfileContent()
    );
    // return Scaffold(
    //     appBar: AppBar(title: const Text('Edit Physican Profile')),
    //     body: const Padding(
    //         padding: EdgeInsets.all(16.0), child: ProfileContent()
    //       )
    //     );
  }
}

class ProfileContent extends StatefulWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  State<ProfileContent> createState() => ProfileContentState();
}

class ProfileContentState extends State<ProfileContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? desc = "gkyhuiadfs";
  bool _edit = false; // false means cannot edit, true means can edit

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop(context);
          },
        ),
        title: const Text('Edit Physican Profile'),
        centerTitle: true,
        actions: <Widget> [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              if (_edit == false) {
                setState(() {
                  _edit = true;
                });
              } else {
                setState(() {
                  _edit = false;
                });
                _formKey.currentState?.save();
                {Map<String, dynamic> payload = {
                  "description": desc,
                };
                // debugPrint("3");
                // debugPrint(desc);
                updatePhysicianProfile(payload);}
              }
            }, 
          )
        ],
      ),
      body: FutureBuilder<Physician>(
          future: retrievePhysicianProfile(null),
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
                      // const Padding(
                      //   padding: EdgeInsets.all(8.0)
                      //   ),
                      gap(),
                      gap(),
                      const Text(
                        'View profile',
                        textAlign: TextAlign.left,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      gap(),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: 3,
                        initialValue: desc,
                        enabled:  _edit,
                        onSaved: (value) => {desc = value},
                        decoration: const InputDecoration(
                          hintText: 'Profile Description',
                          prefixIcon: Icon(Icons.description),
                          contentPadding: EdgeInsets.all(16.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                      ),
                      gap(),
                    ],
                  ),
                ),
              );
            } else {
              return const LoadingScreen("Loading Profile");
            }
          })),
    );
  }

  Widget gap() => const SizedBox(height: 16);
}
