import 'package:flutter/material.dart';
import 'package:pallinet/components/calendar.dart';
import 'package:pallinet/views/calendar_card.dart';
import 'package:pallinet/views/new_account.dart';
import 'package:pallinet/views/patient/patient_home.dart';
import 'package:pallinet/views/patient/patient_login.dart';
import 'package:pallinet/views/physician/patient_detailed_info.dart';
import 'package:pallinet/views/physician/edit_patient_info.dart';
import 'package:pallinet/views/physician/create_appointment.dart';
import 'package:pallinet/views/physician/physician_appointments.dart';
import 'package:pallinet/views/physician/physician_home.dart';
import 'package:pallinet/views/physician/physician_login.dart';
import 'package:pallinet/views/physician/provider_landing_view.dart';
import 'package:pallinet/views/patient/new_entry.dart';
import 'package:pallinet/views/login_view.dart';
import 'package:pallinet/views/home_view.dart';
import 'package:pallinet/views/physician/patients_list.dart';
import 'package:pallinet/views/prescriptions_detailed_view.dart';
import 'package:pallinet/views/prescriptions_summary.dart';
import 'package:pallinet/views/patient/patient_appointments.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pallinet/views/physician/physician_appointment_specifics.dart';
import 'package:pallinet/views/symptoms.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
          '/prescriptionssummary': (context) => const PrescriptionsSummary(),
          '/prescriptionsdetailedview': (context) =>
              const PrescriptionsDetailedView(),
          '/patient/diary/new': (context) => const NewPainDiaryEntry(),
          '/physician/home': (context) => const PhysicianHome(),
          '/patients': (context) => const PatientList(),
          '/physician/patient/details': (context) => const PatientDetails(),
          '/physician/patient/edit_details': (context) =>
              const EditPatientDetails(),
          '/physician/appointments': (context) => const PhysicianAppointments(),
          '/patient/appointments': (context) => const PatientAppointments(),
          '/physician/appointments/new': (context) => const CreateAppointment(),
          '/patient/calendar': (context) => const CalendarView(),
          '/physician/appointment/detail': (context) =>
              const PhysicianAppointmentSpecifics(),
          '/symptoms': (context) => const SymptomsView()
        },
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
