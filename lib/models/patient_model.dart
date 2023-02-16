import 'package:pallinet/constants.dart';

class Patient {
  final bool active;
  final DateTime birthdate;
  final Gender gender;
  final String generalPractitioner;
  final String id;
  final String identifier;
  final Name name;

  Patient(this.active, this.birthdate, this.gender, this.generalPractitioner,
      this.id, this.identifier, this.name);
}

class PatientID {
  final String name;
  final Gender gender;
  final String id;
  final DateTime birthdate;

  PatientID(this.name, this.gender, this.id, this.birthdate);

  @override
  String toString() {
    String bdate = birthdate.toString();
    return 'PatientID: $name $gender $id $bdate';
  }
}

class Name {
  final String family;
  final String given;
  final String prefix = "";
  final String suffix = "";
  final String text;
  final String use;

  Name(this.family, this.given, this.text, this.use);
}
