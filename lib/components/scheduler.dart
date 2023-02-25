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

    return Scaffold(
        appBar: AppBar(
          title: const Text("Temporary"),
        ),
        body: SlidingUpPanel(
            maxHeight: .8 * screenheight,
            panel: Column(children: [
              _ControlBar(
                monthValueNotifier: monthValueNotifier,
              ),
              const Text("Recent Entries", style: TextStyle(fontSize: 16.0)),
              OutlinedButton(
                  onPressed: () => {
                        monthValueNotifier.value = DateTime(2023, 3, 1),
                      },
                  child: const Text("test")),
              const Expanded(
                  flex: 5,
                  child: SizedBox(
                      height: 170,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text("temp")))),
              Expanded(
                  flex: 1,
                  child: Row(
                    children: const [Text("temp")],
                  ))
            ]),
            body: const Center(
              child: Text("OwO"),
            )));
  }
}

class _ControlBar extends StatelessWidget {
  const _ControlBar({required this.monthValueNotifier, super.key});

  final ValueNotifier<DateTime> monthValueNotifier;

  @override
  Widget build(BuildContext context) {
    List<String> daysOfWeek = ["S", "M", "T", "W", "T", "F", "S"];

    return Row(
      children: [
        AnimatedBuilder(
            animation: monthValueNotifier,
            builder: (BuildContext context, Widget? child) {
              return Column(children: [
                Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 12.0),
                    child: Text(getMonth(monthValueNotifier.value),
                        style: Theme.of(context).textTheme.subtitle1)),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 8.0, right: 20.0),
                    child: Expanded(
                        child: SizedBox(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 60,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: ((context, index) {
                            var width =
                                (MediaQuery.of(context).size.width - 40) / 7;
                            var height =
                                MediaQuery.of(context).size.height * 0.01;

                            return Container(
                                width: width,
                                height: height,
                                child: Card(
                                    child: Column(children: [
                                  Text(daysOfWeek[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall),
                                  Text(
                                      "${getDay(monthValueNotifier.value) + index}",
                                      style:
                                          Theme.of(context).textTheme.subtitle1)
                                ])));
                          })),
                    )))
              ]);
            })
      ],
    );
  }
}

int getDay(DateTime date) => date.day;

String getMonth(DateTime date) =>
    DateFormat('MMMM').format(DateTime(0, date.month));

DateTime mostRecentSunday(DateTime date) =>
    DateTime(date.year, date.month, date.day - date.weekday % 7);
