enum ServiceType {
  officeVisit("Office Visit"),
  procedure("Procedure"),
  video("PalliNet Video Call");

  final String value;

  const ServiceType(this.value);
}

enum Gender {
  male("M"),
  female("F");

  final String value;

  const Gender(this.value);
}

enum NumberType {
  mobile("Mobile"),
  home("Home"),
  work("Work"),
  other("Other");

  final String value;

  const NumberType(this.value);
}
