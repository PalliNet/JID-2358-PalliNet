import 'package:flutter/material.dart';

class ProviderLandingPage extends StatelessWidget {
  const ProviderLandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30.0),
                          child: Text("Have a referral?",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 30)),
                        ),
                        OutlinedButton(
                          // ignore: prefer_const_constructors
                          style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              minimumSize: Size(screenWidth / 1.75, 50)),
                          onPressed: () {
                            debugPrint("Not implemented yet");
                            Navigator.pushNamed(context, "/login/patient");
                          },
                          child: const Text(
                            "Click Here",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ]))),
          Expanded(
            flex: 1,
            child: Container(
                alignment: Alignment.center,
                color: Colors.blue,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 30.0),
                        child: Text("Search your local area",
                            style:
                                TextStyle(color: Colors.white, fontSize: 30)),
                      ),
                      OutlinedButton(
                        // ignore: prefer_const_constructors
                        style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            minimumSize: Size(screenWidth / 1.75, 50)),
                        onPressed: () {
                          debugPrint("Not implemented yet");
                          Navigator.pushNamed(context, "/login/patient");
                        },
                        child: const Text(
                          "Click Here",
                          style: TextStyle(color: Colors.blue, fontSize: 20),
                        ),
                      )
                    ])),
          ),
        ],
      ),
    ));
  }
}
