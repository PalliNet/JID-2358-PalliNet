import 'package:flutter/material.dart';
import 'package:pallinet/views/new_account.dart';
import 'package:pallinet/views/patient_home.dart';
import 'package:pallinet/views/patient_login.dart';
import 'package:pallinet/views/physician_home.dart';
import 'package:pallinet/views/physician_login.dart';
import 'package:pallinet/views/provider_landing_view.dart';
import 'package:pallinet/views/new_entry.dart';
import 'package:pallinet/views/login_view.dart';
import 'package:pallinet/views/home_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
