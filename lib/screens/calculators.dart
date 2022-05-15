import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'car_loan_calculator.dart';
import 'crypto_converter.dart';
import 'currency_converter.dart';
import 'home_loan_calculator.dart';
import 'education_loan_calculator.dart';

class CalculatorList extends StatefulWidget {
  const CalculatorList({Key? key}) : super(key: key);

  @override
  _CalculatorListState createState() => _CalculatorListState();
}

class _CalculatorListState extends State<CalculatorList> {
  @override
  Widget build(BuildContext context) {
    List allCalculators = [
      ['Education Loan EMI Calculator', const EducationLoanCalculator()],
      ['Home Loan EMI Calculator', const HomeLoanCalculator()],
      ['Car Loan EMI Calculator', const CarLoanCalculator()],
      ['Crypto Currency Converter', const CryptoConverter()],
      ['Currency Converter', const CurrencyConverter()],
    ];

    List<Widget> widgetList = [];

    for (var i in allCalculators) {
      widgetList.add(Expanded(
        child: Card(
          elevation: 10,
          child: ListTile(
            title: Center(
              child: Text(i[0].toString(),
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => i[1]));
            },
          ),
        ),
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculators'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: widgetList,
        ),
      ),
    );
  }
}
