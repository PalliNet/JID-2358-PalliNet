import 'package:flutter/material.dart';
import 'package:pallinet/new_account.dart';
import 'package:pallinet/patient_home.dart';
import 'package:pallinet/patient_login.dart';
import 'package:pallinet/physician_home.dart';
import 'package:pallinet/physician_login.dart';
import 'package:pallinet/provider_landing_view.dart';
import 'package:pallinet/new_pain_diary_entry.dart';
import 'login_view.dart';
import 'home_view.dart';

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
