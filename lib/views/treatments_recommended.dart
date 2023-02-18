import 'package:flutter/material.dart';

// ignore: camel_case_types
class treatmentsRecommended extends StatelessWidget {
  const treatmentsRecommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Treatments'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 50,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          child: const Text('Instructions / Precautions'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const InstructionsPrecautions()),
            );
          },
        ),
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
