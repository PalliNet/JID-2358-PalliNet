import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen(this.text, {super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
            ),
            const SizedBox(height: 50),
            CircularProgressIndicator(
              semanticsLabel: text,
            ),
          ],
        ),
      ),
    );
  }
}
