import 'package:flutter/material.dart';
import 'package:pallinet/models/entry_model.dart';
// import 'package:pallinet/pain_index.dart';
import 'package:provider/provider.dart';

class NewPainDiaryEntry extends StatefulWidget {
  const NewPainDiaryEntry({super.key});

  @override
  State<NewPainDiaryEntry> createState() => NewPainDiaryEntryState();
}

class NewPainDiaryEntryState extends State<NewPainDiaryEntry> {
  List<String> painDiaryQuestions = <String>[
    "Question 1",
    "Question 2",
    "Question 3",
    "Question 4",
    "Question 5",
  ];

  int questionNum = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: const Text("New Pain Diary Entry"),
          // automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
        ),
        body: ChangeNotifierProvider(
            create: (context) => EntryModel(),
            child: PageView(
              children: [
                Container(
                  color: const Color.fromARGB(255, 211, 211, 211), //255, 211, 211, 211
                  width: screenWidth,
                  height: screenheight,
                  child: SizedBox(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 5, right: 20, left: 20),
                        child: SizedBox(
                            height: 100,
                            child: Text(
                              painDiaryQuestions[questionNum],
                              style: const TextStyle(
                                fontSize: 30,
                              ),
                            )),
                      ),
                      Expanded(
                        child: ListView.separated(
                            padding: const EdgeInsets.all(10),
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return Consumer<EntryModel>(
                                  builder: (context, model, child) => GestureDetector(
                                      child: Container(
                                          height: 60,
                                          color: model.entries[questionNum] == index
                                              ? const Color.fromARGB(255, 116, 72, 213)
                                              : Colors.white,
                                          child: Center(
                                            child: Text('$index', style: const TextStyle(fontSize: 25)),
                                          )),
                                      onTap: () => {
                                            if (model.entries[questionNum] != index) {model.update(questionNum, index)}
                                          }));
                            },
                            separatorBuilder: (BuildContext context, int index) => const Divider(
                                  thickness: 2,
                                  color: Color.fromARGB(255, 95, 95, 95),
                                )),
                      ),
                      // const Expanded(child: SizedBox.shrink()),
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 10, bottom: 5),
                              child: OutlinedButton(
                                  onPressed: () => {
                                        setState(() {
                                          if (questionNum == 0) {
                                            questionNum = 0;
                                          } else {
                                            questionNum -= 1;
                                          }
                                        }),
                                        // debugPrint(
                                        //     "View entries not implemented"),
                                      },
                                  child: const Text("Previous Question"))),
                          const Spacer(),
                          Padding(
                              padding: const EdgeInsets.only(right: 10, bottom: 5),
                              child: OutlinedButton(
                                  onPressed: () => {
                                        setState(() {
                                          if (questionNum == painDiaryQuestions.length - 1) {
                                            questionNum = painDiaryQuestions.length - 1;
                                          } else {
                                            questionNum += 1;
                                          }
                                        }),
                                      },
                                  child: const Text("Next Question")))
                        ],
                      )
                    ],
                  )),
                )
              ],
            )));
  }
}
