import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.route,
      required this.text});

  final IconData icon;
  final Color iconColor;
  final String route;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => {Navigator.pushNamed(context, route)},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Background color
        ),
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Icon(
                icon,
                color: iconColor,
                size: 100,
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(
                height: 10,
              ),
            ),
            Expanded(
                flex: 9,
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                )),
          ],
        ));
  }
}
