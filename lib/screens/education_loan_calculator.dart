import 'package:flutter/material.dart';
import 'package:payment_app/widgets/calc_widget.dart';

class EducationLoanCalculator extends StatefulWidget {
  const EducationLoanCalculator({Key? key}) : super(key: key);

  @override
  _EducationLoanCalculatorState createState() => _EducationLoanCalculatorState();
}

class _EducationLoanCalculatorState extends State<EducationLoanCalculator> {
  @override
  Widget build(BuildContext context) {
    return LoanCalculator(LoanName: 'Education', url: 'https://www.bajajfinserv.in/education-loan-on-property');
  }
}
