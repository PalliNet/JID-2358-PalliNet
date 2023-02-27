import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class SchedulerAppointments extends StatelessWidget {
  const SchedulerAppointments({
    super.key,
    required this.physicianAppointments,
  });

  // final String name;
  // final DateTime timeStart;
  // final DateTime timeEnd;
  final List<Map> physicianAppointments;

  final String name = "temp";
  // 3 to 4:15
  @override
  Widget build(BuildContext context) {
    debugPrint("Inside scheduler appointment");
    debugPrint(physicianAppointments.toString());
    return Positioned.fill(
      child: Container(
          color: Colors.transparent,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double unitWidth = constraints.biggest.width / 8.0;
              double unitHeight = constraints.biggest.height /
                  9.0; // 9.0 is hardcoded for timerange of 8-5
              return Stack(
                children: getChildren(unitWidth, unitHeight),
              );
            },
          )),
    );
  }

  getChildren(unitWidth, unitHeight) {
    List<Positioned> children = [];
    for (var appointment in physicianAppointments) {
      children.add(Positioned(
          top: unitHeight * topOffsetFactor(appointment["timeStart"]),
          left: unitWidth * leftOffsetFactor(appointment["timeStart"]),
          child: Container(
            color: Colors.red,
            height: unitHeight *
                lengthFactor(
                    appointment["timeStart"],
                    appointment[
                        "timeEnd"]), // depends on appointment length needs math
            width: unitWidth,
            child: Text(name),
          )));
    }
    return children;
  }
}

int leftOffsetFactor(DateTime date) => date.weekday + 1;
int topOffsetFactor(DateTime date) =>
    date.subtract(const Duration(hours: 8)).hour; //hardcoded for 8-5
double lengthFactor(DateTime start, DateTime end) =>
    end.difference(start).inMinutes / 60.0;
