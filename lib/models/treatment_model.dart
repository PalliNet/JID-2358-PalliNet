class Treatment {
  final String treatmentType;
  final String schedule;
  final String durationToComplete;

  Treatment(this.treatmentType, this.schedule, this.durationToComplete);

  @override
  String toString() {
    return "$this.treatmentType, $this.schedule, $this.durationToComplete";
  }
}
