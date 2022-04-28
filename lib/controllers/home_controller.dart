import 'dart:math';

import 'package:flutter/material.dart';

import '../data/savings.dart';

class HomeController extends ChangeNotifier {
  Savings _savings = Savings(today: 800, monthlyBudget: 1200, savings: 3200);
  Savings get savings => this._savings;

  set savings(Savings value) {
    this._savings = value;
    notifyListeners();
  }

  void shuffle() {
    savings = Savings(
      today: savings.today + Random().nextInt(1000),
      monthlyBudget: savings.monthlyBudget + Random().nextInt(1000),
      savings: savings.savings + Random().nextInt(1000)
    );
  }
}
