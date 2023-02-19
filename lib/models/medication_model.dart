class Medication {
  final List<String> brands;
  final String dosage;
  final String medication;
  final String orderDetail;

  Medication(this.medication, this.brands, this.dosage, this.orderDetail);

  @override
  String toString() {
    return "$this.medication, $this.dosage, $this.orderDetail";
  }
}
