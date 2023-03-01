import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pallinet/components/scheduler_appointment.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Scheduler extends StatefulWidget {
  final PanelController pc;
  final List<Map> physicianAppointments;
  const Scheduler(
      {super.key, required this.pc, required this.physicianAppointments});

  @override
  State<Scheduler> createState() => _SchedulerState();
}

class _SchedulerState extends State<Scheduler> {
  @override
  Widget build(BuildContext context) {
    DateTime sunday = mostRecentSunday(DateTime.now());

    final ValueNotifier<DateTime> dateNotifier =
        ValueNotifier<DateTime>(sunday);

    double screenheight = MediaQuery.of(context).size.height;

    // debugPrint(
    //     "PHYSICIAN APPOINTMENTS: ${widget.physicianAppointments.toString()}");

    return SlidingUpPanel(
      slideDirection: SlideDirection.DOWN,
      parallaxEnabled: true,
      isDraggable: false,
      minHeight: 0,
      maxHeight: screenheight * 0.85,
      controller: widget.pc,
      panelBuilder: (ScrollController sc) {
        return Column(children: [
          _ControlBar(
            dateNotifier: dateNotifier,
            closeCallback: () => widget.pc.close(),
          ),
          Flexible(
              child: SingleChildScrollView(
                  controller: sc,
                  scrollDirection: Axis.vertical,
                  child: Stack(children: [
                    GridView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 8, childAspectRatio: (0.6 / 1.0)),
                      itemCount: 72,
                      itemBuilder: (BuildContext context, int index) {
                        if (index % 8 == 0) {
                          DateTime open = DateTime(2001, 12, 17, 9);
                          DateTime time = open.add(Duration(hours: index ~/ 8));
                          String formattedTime = DateFormat.Hm().format(time);

                          return Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.grey,
                                width: 0.125,
                              )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Expanded(child: SizedBox()),
                                  Align(
                                    widthFactor: 1.4,
                                    alignment: Alignment.bottomRight,
                                    child: Text(formattedTime,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  )
                                ],
                              ));
                        } else {
                          return Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.grey,
                                width: 0.125,
                              )),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [],
                              ));
                        }
                      },
                    ),
                    SchedulerAppointments(
                      physicianAppointments: widget.physicianAppointments,
                      dateNotifier: dateNotifier,
                    )
                  ])))
        ]);
      },
    );
  }
}

class _ControlBar extends StatelessWidget {
  final Function closeCallback;
  final ValueNotifier<DateTime> dateNotifier;

  const _ControlBar({required this.dateNotifier, required this.closeCallback});

  @override
  Widget build(BuildContext context) {
    List<String> daysOfWeek = ["", "S", "M", "T", "W", "T", "F", "S"];

    bool backButtonEnabled = false;

    return AnimatedBuilder(
        animation: dateNotifier,
        builder: (BuildContext context, Widget? child) {
          return Column(children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  child: Text(
                      "${getMonth(dateNotifier.value)} ${dateNotifier.value.year}",
                      style: Theme.of(context).textTheme.titleLarge),
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Material(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: IconButton(
                        disabledColor: Colors.grey,
                        onPressed: backButtonEnabled
                            ? () {
                                dateNotifier.value = dateNotifier.value
                                    .subtract(const Duration(days: 7));
                                if (isCurrentWeek(dateNotifier.value)) {
                                  backButtonEnabled = false;
                                }
                              }
                            : null,
                        icon: const Icon(Icons.arrow_left))),
                Material(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: IconButton(
                        onPressed: () {
                          dateNotifier.value =
                              dateNotifier.value.add(const Duration(days: 7));
                          if (!isCurrentWeek(dateNotifier.value)) {
                            backButtonEnabled = true;
                          }
                        },
                        icon: const Icon(Icons.arrow_right))),
                Material(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: IconButton(
                        disabledColor: Colors.grey,
                        onPressed: () => {closeCallback()},
                        icon: const Icon(Icons.cancel))),
              ],
            ),
            Center(
                child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8),
                itemCount: 8,
                itemBuilder: (context, index) {
                  if (index != 0) {
                    return Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 0.125,
                        )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(daysOfWeek[index],
                                style: Theme.of(context).textTheme.bodySmall),
                            Text(
                                "${getDay(dateNotifier.value.add(Duration(days: index - 1)))}",
                                style: Theme.of(context).textTheme.subtitle1)
                          ],
                        ));
                  } else {
                    return Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 0.125,
                        )),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                        ));
                  }
                },
              ),
            ))
          ]);
        });
  }
}

int getDay(DateTime date) => date.day;

String getMonth(DateTime date) =>
    DateFormat('MMMM').format(DateTime(0, date.month));

DateTime mostRecentSunday(DateTime date) =>
    DateTime(date.year, date.month, date.day - date.weekday % 7);

bool isCurrentWeek(DateTime date) =>
    DateTime.now().isAfter(date) &&
    DateTime.now().isBefore(date.add(const Duration(days: 7)));
