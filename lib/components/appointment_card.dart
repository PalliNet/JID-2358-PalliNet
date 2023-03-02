import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pallinet/firestore/firestore.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.name,
    required this.date,
  });

  final String name;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {retrieveAppointmentsPhysicians()},
        child: Card(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Expanded(
                flex: 1,
                child: Icon(Icons.account_circle, size: 48),
              ),
              Expanded(
                flex: 4,
                child:
                    _AppointmentDescription(name: name, date: date),
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
    required this.date,
  });

  final String name;
  final DateTime date;

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
              fontSize: 18.0,
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
          const Text(
            'Appointment Type: Checkup',
            style: TextStyle(fontSize: 14.0),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
          Text(
            'Time: ${DateFormat('hh:mm').format(date)}',
            style: const TextStyle(fontSize: 14.0),
          ),
          Text(
            'Date ${DateFormat('MM-dd-yyyy').format(date)}',
            style: const TextStyle(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
