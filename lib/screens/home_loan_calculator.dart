import 'package:flutter/material.dart';
import 'package:payment_app/widgets/calc_widget.dart';

class HomeLoanCalculator extends StatefulWidget {
  const HomeLoanCalculator({Key? key}) : super(key: key);

  @override
  _HomeLoanCalculatorState createState() => _HomeLoanCalculatorState();
}

class _HomeLoanCalculatorState extends State<HomeLoanCalculator> {
  @override
  Widget build(BuildContext context) {
    return LoanCalculator(LoanName: 'Home', url: 'https://homeloans.sbi/');
  }
}
