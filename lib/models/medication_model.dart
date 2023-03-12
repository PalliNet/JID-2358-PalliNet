class Medication {
  final List<String> brands;
  final String dosage;
  final String medication;
  final String orderDetail;
  final String precautions;

  Medication(this.medication, this.brands, this.dosage, this.orderDetail,
      this.precautions);

  @override
  String toString() {
    return "$this.medication, $this.dosage, $this.orderDetail, $this.precautions";
  }
}
