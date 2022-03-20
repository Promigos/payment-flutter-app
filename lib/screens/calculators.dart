import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_loan_calculator.dart';

class CalculatorList extends StatefulWidget {
  const CalculatorList({Key? key}) : super(key: key);

  @override
  _CalculatorListState createState() => _CalculatorListState();
}

class _CalculatorListState extends State<CalculatorList> {
  @override
  Widget build(BuildContext context) {
    List allCalculators = [
      ['EMI Calculator', const HomeLoanCalculator()],
      ['Home Loan Calculator', const HomeLoanCalculator()],
      ['Car Loan Calculator', const HomeLoanCalculator()],
      ['Crypto Currency Converter', const HomeLoanCalculator()],
      ['Currency Converter', const HomeLoanCalculator()],
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculators'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: allCalculators.length,
              itemBuilder: (_, i) {
                return ListTile(
                    title: Text(
                        allCalculators[i][0].toString(),
                        style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.bold,)
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => allCalculators[i][1]));
                    },
                  );
              }),
        ),
      ),
    );
  }
}
