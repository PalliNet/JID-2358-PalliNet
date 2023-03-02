class Treatment {
  final String treatmentType;
  final String schedule;
  final String durationToComplete;
  final String detailedInstructions;

  Treatment(this.treatmentType, this.schedule, this.durationToComplete,
      this.detailedInstructions);

  @override
  String toString() {
    return "$this.treatmentType, $this.schedule, $this.durationToComplete, $this.detailedInstructions";
  }
}
