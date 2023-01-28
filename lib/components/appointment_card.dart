import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.name,
    required this.id,
    required this.age,
    required this.sex,
    required this.birthdate,
  });

  final String name;
  final String id;
  final int age;
  final String sex;
  final DateTime birthdate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {debugPrint('$name tapped')},
        child: Card(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Icon(Icons.account_circle, size: 48),
              ),
              Expanded(
                flex: 4,
                child: _AppointmentDescription(
                  name: name,
                  id: id,
                  age: age,
                  sex: sex,
                  birthdate: birthdate,
                ),
              ),
              const Icon(
                Icons.more_vert,
                size: 16.0,
              ),
            ],
          ),
        )));
  }
}

class _AppointmentDescription extends StatelessWidget {
  const _AppointmentDescription({
    required this.name,
    required this.id,
    required this.age,
    required this.sex,
    required this.birthdate,
  });

  final String name;
  final String id;
  final int age;
  final String sex;
  final DateTime birthdate;

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en,', null);
    return Padding(
      padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          Text(
            'id: $id',
            style: const TextStyle(fontSize: 10.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            '$age Years $sex DOB: ${DateFormat('MM-dd-yyyy').format(birthdate)}',
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
