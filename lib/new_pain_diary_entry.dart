import 'package:flutter/material.dart';
import 'package:pallinet/pain_index.dart';

class NewPainDiaryEntry extends StatefulWidget {
  const NewPainDiaryEntry({super.key});

  @override
  State<NewPainDiaryEntry> createState() => NewPainDiaryEntryState();
}

class NewPainDiaryEntryState extends State<NewPainDiaryEntry> {
  List<painIndex> indices = <painIndex>[painIndex(1), painIndex(2), painIndex(3), painIndex(4), 
    painIndex(5), painIndex(6), painIndex(7), painIndex(8), painIndex(9), painIndex(10)];

  List<String> painDiaryQuestions = <String>[
    "Question 1",
    "Question 2",
    "Question 3",
    "Question 4",
    "Question 5",
  ];

  int numPressed = 0;
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
      body: PageView(
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
                        )
                      ), 
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.all(10),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            child: Container(
                              height: 60,
                              color: indices[index].isSelected ?const Color.fromARGB(255, 116, 72, 213) : Colors.white,
                              child: Center(
                                child: Text('${indices[index].value}', 
                                style: const TextStyle(fontSize: 25)),
                                )
                            ),
                            onTap: () => {
                              if (indices[index].isSelected == false && numPressed == 0) {
                                setState(() {
                                  indices[index].isSelected = true;
                                  numPressed += 1;
                                }),
                              } else {
                                if (indices[index].isSelected == false && numPressed == 1) {
                                  setState(() {
                                    for (int i = 0; i < indices.length; i++) {
                                      if (indices[i].isSelected == true) {
                                        indices[i].isSelected = false;
                                        indices[index].isSelected = true;
                                        break;
                                      }
                                    }
                                  }),
                                } else if (indices[index].isSelected == true) {
                                  setState(() {
                                    indices[index].isSelected = false;
                                    numPressed = 0;
                                  }),
                                }
                              }
                            }
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => const Divider(
                          thickness: 3,
                          color: Color.fromARGB(255, 95, 95, 95),
                        )
                      ),
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
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 5),
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
      ),
    );
  }
}
