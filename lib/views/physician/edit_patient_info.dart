import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pallinet/components/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pallinet/firestore/firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class EditPatientDetails extends StatefulWidget {
  const EditPatientDetails({super.key});

  @override
  State<EditPatientDetails> createState() => EditPatientDetailsState();
}

class EditPatientDetailsState extends State<EditPatientDetails> {
  // EditPatientDetailsState({super.key});
  // String sex = "";
  Map<dynamic, dynamic> patientDetails = {};
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();

  Widget gap() => const Divider(
        height: 10,
        color: Colors.black,
      );

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: const Text("Edit Patient")),
  //     body: ListView(
  //       padding: const EdgeInsets.all(10),
  //       children: [
  //         const Text('Sex:\nMale',
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
  //         gap(),
  //         TextFormField(
  //           onChanged: (value) {
  //             patientDetails[0] = value;
  //             debugPrint(patientDetails.toString());
  //           },
  //           decoration: InputDecoration(labelText: "Input Sex"),
  //           validator: (value) {
  //             if (value!.isEmpty) {
  //               return "Enter valid input";
  //             } else {
  //               return null;
  //             }
  //           },
  //         ),
  //         const Text('Age:\n87',
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
  //         gap(),
  //         TextFormField(
  //           onChanged: (value) {
  //             patientDetails[1] = value;
  //             debugPrint(patientDetails.toString());
  //           },
  //           decoration: InputDecoration(labelText: "Age"),
  //           validator: (value) {
  //             if (value!.isEmpty) {
  //               return "Enter valid input";
  //             } else {
  //               return null;
  //             }
  //           },
  //         ),
  //         const Text('MRN:\n142617',
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
  //         gap(),
  //         TextFormField(
  //           onChanged: (value) {
  //             patientDetails[2] = value;
  //             debugPrint(patientDetails.toString());
  //           },
  //           decoration: InputDecoration(labelText: "MRN"),
  //           validator: (value) {
  //             if (value!.isEmpty) {
  //               return "Enter valid input";
  //             } else {
  //               return null;
  //             }
  //           },
  //         ),
  //         const Text('DOB:\n12-17-1935',
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
  //         gap(),
  //         TextFormField(
  //           onChanged: (value) {
  //             patientDetails[3] = value;
  //             debugPrint(patientDetails.toString());
  //           },
  //           decoration: InputDecoration(labelText: "DOB"),
  //           validator: (value) {
  //             if (value!.isEmpty) {
  //               return "Enter valid input";
  //             } else {
  //               return null;
  //             }
  //           },
  //         ),
  //         const Text('Pain Regiment:',
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
  //         gap(),
  //         TextFormField(
  //           onChanged: (value) {
  //             patientDetails[4] = value;
  //             debugPrint(patientDetails.toString());
  //           },
  //           decoration: InputDecoration(labelText: "Pain Regiment"),
  //           validator: (value) {
  //             if (value!.isEmpty) {
  //               return "Enter valid input";
  //             } else {
  //               return null;
  //             }
  //           },
  //         ),
  //         const Text('Last Visit:\n 1-28-23',
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
  //         gap(),
  //         TextFormField(
  //           onChanged: (value) {
  //             patientDetails[5] = value;
  //             debugPrint(patientDetails.toString());
  //           },
  //           decoration: InputDecoration(labelText: "Last Visit"),
  //           validator: (value) {
  //             if (value!.isEmpty) {
  //               return "Enter valid input";
  //             } else {
  //               return null;
  //             }
  //           },
  //         ),
  //         const Text('Last 3 pain scores / recent trends:\n 80,90,100',
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
  //         gap(),
  // TextFormField(
  //   onChanged: (value) {
  //     patientDetails[6] = value;
  //     debugPrint(patientDetails.toString());
  //   },
  //   decoration: InputDecoration(labelText: "Recent Scores"),
  //   validator: (value) {
  //     if (value!.isEmpty) {
  //       return "Enter valid input";
  //     } else {
  //       return null;
  //     }
  //   },
  // ),
  //         const Text('Medical History(Clickable):',
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
  //         gap(),
  //         const Text('Surgical History(Clickable):',
  //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
  //         gap(),
  // SizedBox(
  //   height: 100,
  //   width: 100,
  //   child: OutlinedButton(
  //     onPressed: () {
  //       // Navigator.pushNamed(context, "/physician/patient/edit_details");
  //     },
  //     child: const Text(
  //       "Save",
  //       style: TextStyle(fontSize: 25),
  //     ),
  //   ),
  // )
  //       ],
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    debugPrint(ModalRoute.of(context)?.settings.arguments.toString());
    final arguments = ModalRoute.of(context)?.settings.arguments ?? '';
    debugPrint("Edit Patients");
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
              body: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Text('Gender: ${datas['gender']}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      gap(),
                      TextFormField(
                        onSaved: (value) {
                          patientDetails['gender'] = value;
                          debugPrint(patientDetails.toString());
                        },
                        decoration: const InputDecoration(
                          hintText: 'Gender',
                          prefixIcon: Icon(Icons.man),
                          helperText: ' ',
                        ),
                        validator: (value) {
                          if (value != "M" &&
                              value != "F" &&
                              value!.isNotEmpty) {
                            return "Enter valid input";
                          } else {
                            return null;
                          }
                        },
                      ),
                      Text('DOB: ${DateFormat('MM-dd-yyyy').format(birthdate)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      gap(),
                      TextFormField(
                        // validator: (value) => dateValidation(value),
                        controller: _dateController,
                        readOnly: true,
                        onTap: () => DatePicker.showDatePicker(context,
                            showTitleActions: true, onChanged: (date) {
                          patientDetails["birthdate"] = date;
                        }, onConfirm: (date) {
                          _dateController.text = DateFormat('MM/dd/yyyy')
                              .format(patientDetails["birthdate"]);
                        }, currentTime: patientDetails["birthdate"]),
                        decoration: const InputDecoration(
                          hintText: 'Date',
                          prefixIcon: Icon(Icons.calendar_month),
                          helperText: ' ',
                        ),
                      ),
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
                          onPressed: () {},
                          child: const Text('Medical History')),
                      gap(),
                      TextButton(
                          onPressed: () {},
                          child: const Text('Surgical History')),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: OutlinedButton(
                          onPressed: () {
                            debugPrint(patientDetails.toString());
                            if (_formKey.currentState?.validate() ?? false) {
                              _formKey.currentState?.save();
                              updatePatientDetails(patientDetails, arguments);
                            }

                            // Navigator.pushNamed(
                            //     // context, "/physician/patient/edit_details");
                            //     context, "patients");
                            // setState(() {
                            //   return;
                            // });
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      )
                    ],
                  )));
        } else {
          return const LoadingScreen('Loading Patient Details');
        }
      }),
    );
  }
}
