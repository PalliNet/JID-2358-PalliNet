import 'package:flutter/material.dart';

class NewPainDiaryEntry extends StatelessWidget {
  const NewPainDiaryEntry({super.key});

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
            color: const Color.fromARGB(255, 211, 211, 211),
            width: screenWidth,
            height: screenheight,
            child: FractionallySizedBox(
                widthFactor: 0.95,
                heightFactor: 0.95,
                child: Column(
                  children: [
                    Text("temp"),
                    const Expanded(child: SizedBox.shrink()),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(left: 10, bottom: 5),
                            child: OutlinedButton(
                                onPressed: () => {
                                      debugPrint(
                                          "View entries not implemented"),
                                    },
                                child: const Text("Previous Question"))),
                        const Spacer(),
                        Padding(
                            padding:
                                const EdgeInsets.only(right: 10, bottom: 5),
                            child: OutlinedButton(
                                onPressed: () => {
                                      debugPrint("OwO"),
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
