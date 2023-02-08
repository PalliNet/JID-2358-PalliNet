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
