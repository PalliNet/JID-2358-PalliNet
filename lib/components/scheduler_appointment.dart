import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class SchedulerAppointmentCard extends StatelessWidget {
  const SchedulerAppointmentCard({
    super.key,
    required this.name,
    required this.timeStart,
    required this.timeEnd,
  });

  final String name;
  final DateTime timeStart;
  final DateTime timeEnd;

  // 3 to 4:15
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
        top: 0,
        left: (screenWidth / 8.0) * leftOffsetFactor(timeStart),
        child: Container(
          color: Colors.red,
          height:
              screenHeight / 9.0, // depends on appointment length needs math
          width: screenWidth / 8.0,
          child: Text(name),
        ));
  }
}

int leftOffsetFactor(DateTime date) => date.weekday + 1;
// int topOffsetFactor(DateTime date)
