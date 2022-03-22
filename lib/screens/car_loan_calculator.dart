import 'package:flutter/material.dart';
import 'package:payment_app/widgets/calc_widget.dart';

class CarLoanCalculator extends StatefulWidget {
  const CarLoanCalculator({Key? key}) : super(key: key);

  @override
  _CarLoanCalculatorState createState() => _CarLoanCalculatorState();
}

class _CarLoanCalculatorState extends State<CarLoanCalculator> {
  @override
  Widget build(BuildContext context) {
    return LoanCalculator(LoanName: 'Car', url: 'https://www.axisbank.com/retail/loans/car-loan');
  }
}
