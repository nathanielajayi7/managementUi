class Savings {
  double today;
  double monthlyBudget;
  double savings;
  double get totalBalance => today + monthlyBudget + savings;
  Savings(
      {this.today = 0,
      required this.monthlyBudget,
      required this.savings});
}
