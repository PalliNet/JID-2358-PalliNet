import 'package:pallinet/constants.dart';

class Physician {
  final String name;
  // final DateTime birthdate;
  final Gender gender;
  final String id;
  final String description;

  Physician(this.name, this.gender, this.id, this.description);
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
