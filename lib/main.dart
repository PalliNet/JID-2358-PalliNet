import 'package:flutter/material.dart';
import 'package:pallinet/NewAccount.dart';
import 'package:pallinet/PatientHome.dart';
import 'package:pallinet/PatientLogin.dart';
import 'package:pallinet/PhysicianHome.dart';
import 'package:pallinet/PhysicianLogin.dart';
import 'package:pallinet/ProviderLandingPage.dart';
import 'package:pallinet/NewPainDiaryEntry.dart';
import 'LoginLandingPage.dart';
import 'HomePage.dart';

void main() {
  runApp(const PalliNet());
}

class PalliNet extends StatelessWidget {
  const PalliNet({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          '/login': (context) => const LoginLandingPage(),
          '/login/patient': (context) => const PatientLogin(),
          '/login/physician': (context) => const PhysicianLogin(),
          '/new/patient': (context) => const NewAccount(),
          '/provider': (context) => const ProviderLandingPage(),
          '/patient/home': (context) => const PatientHome(),
          '/patient/diary/new': (context) => const NewPainDiaryEntry(),
          '/physician/home': (context) => const PhysicianHome(),
        },
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
