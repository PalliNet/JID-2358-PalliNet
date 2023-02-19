import 'package:flutter/material.dart';

import '../firestore/firestore.dart';

class PainDiary extends StatelessWidget {
  const PainDiary({super.key});

  List<DataColumn> getCol(List<String> col) {
    col.sort();
    List<DataColumn> dataColumns =
        col.map((string) => DataColumn(label: Text(string))).toList();
    return dataColumns;
  }

  DataRow getRow(Map<String, dynamic> map, int length) {
    debugPrint("GET ROW");
    List<DataCell> entries = [];
    for (var i = 0; i < length; i++) {
      // entries.add(map["q$i"]);
      // debugPrint(map["q$i"].toString());
      if (map["q$i"] != null) {
        String s = map["q$i"].toString();
        entries.add(DataCell(Text(s)));
      } else {
        entries.add(const DataCell(Text("NULL")));
      }
      // debugPrint("added $i");
    }
    // debugPrint("ENTRIES");
    // debugPrint(entries.toString());

    return DataRow(cells: entries);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: retrieveEntries(),
      builder: ((context, snapshot) {
        if (snapshot.data == null) {
          return const SizedBox.shrink();
        }
        final list = snapshot.data ?? [];
        debugPrint("list");
        debugPrint(list.toString());
        debugPrint(list.runtimeType.toString());

        return Scaffold(
            appBar: AppBar(
              title: const Text("Pain Diary"),
              automaticallyImplyLeading: false,
              backgroundColor: const Color.fromARGB(255, 108, 125, 133),
            ),
            body: Container(
              color: const Color.fromARGB(255, 211, 211, 211),
              height: 650,
              child: Column(children: [
                const Text("Recent Entries", style: TextStyle(fontSize: 16.0)),
                // SizedBox(
                //     height: 150,
                //     child: ListView.builder(
                //       scrollDirection: Axis.vertical,
                //       shrinkWrap: true,
                //       itemCount: list?.length,
                //       // itemCount: 2,
                //       itemBuilder: (BuildContext context, int index) {
                //         dynamic data = list?[index];
                //         dynamic temp = "";
                //         for (var i = 0; i < 6; i++) {
                //           if (data["q$i"] != null) {
                //             // temp += "q$i:";
                //             temp += data["q$i"].toString();
                //             temp += "        ";
                //           }
                //         }
                //         debugPrint(temp);
                //         const Padding(
                //             padding: EdgeInsets.symmetric(vertical: 4.0));
                //         return Text(temp,
                //             textAlign: TextAlign.center,
                //             style: const TextStyle(fontSize: 16.0));
                //         //
                //       },
                //     )),
                // const Text("temp holder"),
                SizedBox(
                  height: 192,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                        columns: getCol(list[0].keys.toList()),
                        rows: List.generate(list.length,
                            (index) => getRow(list[index], list[0].length))),
                  ),
                ),

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
            ));
      }),
    );
  }
}
