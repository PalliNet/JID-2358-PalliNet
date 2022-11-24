import 'package:flutter/material.dart';

class PainDiary extends StatelessWidget {
  const PainDiary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pain Diary"),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 108, 125, 133),
      ),
      body: ListView(
        children: [
          Container(
            color: const Color.fromARGB(255, 211, 211, 211),
            height: 200,
            child: Column(children: [
              const Text("temp holder"),
              const Expanded(child: SizedBox.shrink()),
              Row(
                children: [
                  const Spacer(),
                  Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 5),
                      child: OutlinedButton(
                          onPressed: () => {
                                debugPrint("View entries not implemented"),
                              },
                          child: const Text("View Entries"))),
                  Padding(
                      padding: const EdgeInsets.only(right: 10, bottom: 5),
                      child: OutlinedButton(
                          onPressed: () => {
                                Navigator.pushNamed(
                                    context, "/patient/diary/new"),
                              },
                          child: const Text("New Entry")))
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
