import 'package:flutter/material.dart';
import 'package:pallinet/models/physician_model.dart';
import 'package:pallinet/models/session_manager.dart';
import 'package:pallinet/firestore/firestore.dart';

class PhysicianHome extends StatefulWidget {
  const PhysicianHome({super.key});

  @override
  State<PhysicianHome> createState() => _PhysicianHomeState();
}

class _PhysicianHomeState extends State<PhysicianHome> {
  late final SessionManager _prefs;

  @override
  void initState() {
    _prefs = SessionManager();
    super.initState();
  }

  @override
  void dispose() {
    _prefs.clearAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    String name;

    return FutureBuilder<Physician>(
        future: _prefs.getUid().then((uid) => retrievePhysicianProfile(uid)),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            Physician? physData = snapshot.data;
            name = physData!.name;

            return Scaffold(
              appBar: AppBar(title: Text("Dr. $name")),
              body: ListView(
                padding: const EdgeInsets.all(8),
                children: [
                  ElevatedButton(
                      onPressed: () => {Navigator.pushNamed(context, "/patients")},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.assignment_ind,
                            color: Colors.pink,
                            size: 120,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Patients',
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          )
                        ],
                      )),
                  ElevatedButton(
                      onPressed: () => {Navigator.pushNamed(context, "/physician/appointments")},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.schedule,
                            color: Colors.pink,
                            size: 120,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Appointments',
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          )
                        ],
                      )),
                  ElevatedButton(
                      onPressed: () => {Navigator.pushNamed(context, "/physician/profile")},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // Background color
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.settings,
                            color: Colors.pink,
                            size: 120,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Edit Profile',
                            style: TextStyle(fontSize: 30, color: Colors.black),
                          )
                        ],
                      )),
                ],
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
                      "Loading Home",
                    ),
                    SizedBox(height: 50),
                    CircularProgressIndicator(
                      semanticsLabel: "Loading Home",
                    ),
                  ],
                ),
              ),
            );
          }
        }));
  }
}
