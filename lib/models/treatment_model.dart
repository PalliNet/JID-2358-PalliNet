class Treatment {
  final String typetreatment;
  final String schedule;
  final String durationToComplete;

  Treatment(this.typetreatment, this.schedule, this.durationToComplete);

  @override
  String toString() {
    return "$this.typetreatment, $this.schedule, $this.durationToComplete";
  }
}
