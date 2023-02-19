import 'package:flutter/material.dart';

class Treatments extends StatelessWidget {
  const Treatments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Treatments'),
      ),
      body: ListView(
      children: [
        InkWell(
        onTap: () => {debugPrint('Dialysis')},
        child: Card(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child:
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Self Dialysis",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                        Text(
                          'Conducted 6 to 7 times a week',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                        Text(
                          'Time to complete: roughly 2 hours',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  )
              ),
              const Icon(
                Icons.more_vert,
                size: 16.0,
              ),
            ],
          ),
        ))
        ),
        InkWell(
        onTap: () => {debugPrint('Physical Therapy')},
        child: Card(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child:
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        Text(
                          "Physical Therapy",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                        Text(
                          'Visit 2 to 3 times a week',
                          style: TextStyle(fontSize: 14.0),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 1.0)),
                        Text(
                          'Time: 30 - 90 minutes',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  )
              ),
              const Icon(
                Icons.more_vert,
                size: 16.0,
              ),
            ],
          ),
        ))
        )
        
      ]
      ),
    );
  }
}

class InstructionsPrecautions extends StatelessWidget {
  const InstructionsPrecautions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instructions / Precautions'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('return'),
        ),
      ),
    );
  }
}
