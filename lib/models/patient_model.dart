import 'package:pallinet/constants.dart';

class Patient {
  final bool active;
  final DateTime birthDate;
  final Gender gender;
  final String generalPractitioner;
  final String id;
  final String identifier;
  final Name name;

  Patient(this.active, this.birthDate, this.gender, this.generalPractitioner, this.id, this.identifier, this.name);
}

class PatientID {
  final String name;
  final Gender gender;
  final String id;
  final DateTime birthDate;

  PatientID(this.name, this.gender, this.id, this.birthDate);

  @override
  String toString() {
    String bdate = birthDate.toString();
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
