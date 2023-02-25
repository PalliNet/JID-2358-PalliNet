import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Scheduler extends StatefulWidget {
  const Scheduler({super.key});

  @override
  State<Scheduler> createState() => _SchedulerState();
}

class _SchedulerState extends State<Scheduler> {
  // const Scheduler({required this.appointments, super.key});
  @override
  Widget build(BuildContext context) {
    DateTime sunday = mostRecentSunday(DateTime.now());

    final ValueNotifier<DateTime> monthValueNotifier =
        ValueNotifier<DateTime>(sunday);

    double screenheight = MediaQuery.of(context).size.height;

    PanelController pc = PanelController();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Temporary"),
        ),
        body: SlidingUpPanel(
            isDraggable: true,
            maxHeight: .8 * screenheight,
            controller: pc,
            panelBuilder: (ScrollController sc) {
              return Column(children: [
                _ControlBar(
                  monthValueNotifier: monthValueNotifier,
                ),
                Flexible(
                    child: SingleChildScrollView(
                        controller: sc,
                        scrollDirection: Axis.vertical,
                        child: GridView.builder(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 8,
                                  mainAxisSpacing: 0,
                                  crossAxisSpacing: 0,
                                  childAspectRatio: (0.6 / 1.0)),
                          itemCount: 72,
                          itemBuilder: (BuildContext context, int index) {
                            if (index % 8 == 0) {
                              DateTime open = DateTime(2001, 12, 17, 9);
                              DateTime time =
                                  open.add(Duration(hours: index ~/ 8));
                              String formattedTime =
                                  DateFormat.Hm().format(time);

                              return Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                    color: Colors.grey,
                                    width: 0.125,
                                  )),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Expanded(
                                          child: SizedBox(
                                        height: 10,
                                      )),
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
                        )))
              ]);
            },
            body: const Center(
              child: Text("Temp"),
            )));
  }
}

class _ControlBar extends StatelessWidget {
  const _ControlBar({required this.monthValueNotifier});

  final ValueNotifier<DateTime> monthValueNotifier;

  @override
  Widget build(BuildContext context) {
    List<String> daysOfWeek = ["", "S", "M", "T", "W", "T", "F", "S"];

    var height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
        animation: monthValueNotifier,
        builder: (BuildContext context, Widget? child) {
          return Column(children: [
            Text(getMonth(monthValueNotifier.value),
                style: Theme.of(context).textTheme.subtitle1),
            Center(
              child: SizedBox(
                  // width: MediaQuery.of(context).size.width,
                  height: height * 0.08,
                  child: GridView.count(
                      childAspectRatio: (1 / 0.941),
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 1,
                      children: List.generate(8, (index) {
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  Text(
                                      "${getDay(monthValueNotifier.value) + index - 1}",
                                      style:
                                          Theme.of(context).textTheme.subtitle1)
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
                      }))),
            ),
          ]);
        });
  }
}

int getDay(DateTime date) => date.day;

String getMonth(DateTime date) =>
    DateFormat('MMMM').format(DateTime(0, date.month));

DateTime mostRecentSunday(DateTime date) =>
    DateTime(date.year, date.month, date.day - date.weekday % 7);
