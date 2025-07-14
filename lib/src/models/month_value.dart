class MonthValue {
  String month;
  DateTime period;
  double availableValue;
  double usedValue;
  double limitValue;
  List<String>? releases;

  MonthValue({
    required this.month,
    required this.period,
    required this.availableValue,
    required this.usedValue,
    required this.limitValue,
    this.releases,
  });
}
