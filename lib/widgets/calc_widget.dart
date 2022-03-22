import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/widgets/custom_sliver.dart';
import 'package:payment_app/utils/constants.dart' as constants;
import 'package:payment_app/utils/url_launch.dart';
class LoanCalculator extends StatefulWidget {
  String url;
  String LoanName;

  late int minLoan;
  late int maxLoan;
  late double minRate;
  late double maxRate;
  late int minTenure;
  late int maxTenure;

  late int initLoan;
  late double initRate;
  late int initTenure;
  LoanCalculator({Key? key, required this.LoanName,required this.url}) : super(key: key);

  @override
  _LoanCalculatorState createState() => _LoanCalculatorState();
}

class _LoanCalculatorState extends State<LoanCalculator> {
  String result = 'We help you calculate your EMI';

  late double _rateValue;
  late int _loanAmount;
  late int _tenureValue;

  final _formKey = GlobalKey<FormState>();
  final rateController = TextEditingController();
  final loanController = TextEditingController();
  final tenureController = TextEditingController();

  @override
  void initState() {
    if(widget.LoanName == 'Home'){
      widget.minLoan = 100000;
      widget.maxLoan = 10000000;
      widget.initLoan = 1500000;

      widget.minRate = 0.0;
      widget.maxRate = 15.0;
      widget.initRate = 7.0;

      widget.minTenure = 1;
      widget.maxTenure = 30;
      widget.initTenure = 6;
    }
    else if(widget.LoanName == 'Car'){
      //Change min, max and init values based on the type of loan
      widget.minLoan = 100000;
      widget.maxLoan = 10000000;
      widget.initLoan = 1500000;

      widget.minRate = 0.0;
      widget.maxRate = 15.0;
      widget.initRate = 7.0;

      widget.minTenure = 1;
      widget.maxTenure = 30;
      widget.initTenure = 6;
    }
    else if(widget.LoanName == 'Education'){
      //Change min, max and init values based on the type of loan
      widget.minLoan = 100000;
      widget.maxLoan = 10000000;
      widget.initLoan = 1500000;

      widget.minRate = 0.0;
      widget.maxRate = 15.0;
      widget.initRate = 7.0;

      widget.minTenure = 1;
      widget.maxTenure = 30;
      widget.initTenure = 6;
    }

    super.initState();
    rateController.addListener(_setStartValue);
    loanController.addListener(_setLoanAmountValue);
    tenureController.addListener(_setTenureValue);

    setState(() {
      _rateValue = widget.initRate;
      rateController.text = _rateValue.toString();
      _loanAmount = widget.initLoan;
      loanController.text = _loanAmount.toString();
      _tenureValue = widget.initTenure;
      tenureController.text = _tenureValue.toString();
    });
  }

  _setLoanAmountValue() {
    int minValue = widget.minLoan;
    int maxValue = widget.maxLoan;
    if (int.parse(loanController.text) >= minValue &&
        int.parse(loanController.text) <= maxValue) {
      setState(() {
        _loanAmount = int.parse(loanController.text);
      });
    }
    else if(int.parse(loanController.text) > maxValue){
      setState(() {
        _loanAmount = maxValue;
        loanController.text = _loanAmount.toString();
      });
    }
    else{
      setState(() {
        _loanAmount = minValue;
        loanController.text = _loanAmount.toString();
      });
    }
  }

  _setTenureValue(){
    int minValue = widget.minTenure;
    int maxValue = widget.maxTenure;
    if (int.parse(tenureController.text) >= minValue &&
        int.parse(tenureController.text) <= maxValue) {
      setState(() {
        _tenureValue = int.parse(tenureController.text);
      });
    }
    else if(int.parse(tenureController.text) > maxValue){
      setState(() {
        _tenureValue = maxValue;
        tenureController.text = _tenureValue.toString();
      });
    }
    else{
      setState(() {
        _tenureValue = minValue;
        tenureController.text = _tenureValue.toString();
      });
    }
  }

  _setStartValue() {
    double minValue = widget.minRate;
    double maxValue = widget.maxRate;
    if (double.parse(rateController.text) >= minValue &&
        double.parse(rateController.text) <= maxValue) {
      setState(() {
        _rateValue = double.parse(rateController.text).roundToDouble();
      });
    }
    else if(double.parse(rateController.text) > maxValue){
      setState(() {
        _rateValue = 15.0;
        rateController.text = _rateValue.toString();
      });
    }
    else{
      setState(() {
        _rateValue = 0.0;
        rateController.text = _rateValue.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.LoanName+' Loan Calculator'),
        ),
        body: CustomSliverView(
            columnList: [
              const SizedBox(height: 25,),
              Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 8,),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Loan Amount',
                                style: GoogleFonts.montserrat(fontSize: 17),
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: TextFormField(
                                controller: loanController,
                                style: GoogleFonts.montserrat(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        value: _loanAmount.toDouble(),
                        min: 100000,
                        max: 10000000,
                        activeColor: Colors.blueAccent,
                        inactiveColor: Colors.grey,
                        label: _loanAmount.round().toString(),
                        onChanged: (double newValue) {
                          setState(() {
                            _loanAmount = newValue.round();
                            loanController.text = _loanAmount.toString();
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 8,),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Tenure(Years)',
                                style: GoogleFonts.montserrat(fontSize: 17),
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: TextFormField(
                                controller: tenureController,
                                style: GoogleFonts.montserrat(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        value: _tenureValue.toDouble(),
                        min: 1,
                        max: 30,
                        activeColor: Colors.blueAccent,
                        inactiveColor: Colors.grey,
                        label: _tenureValue.round().toString(),
                        onChanged: (double newValue) {
                          setState(() {
                            _tenureValue = newValue.round();
                            tenureController.text = _tenureValue.toString();
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 8,),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Rate of Interest(% P.A)',
                                style: GoogleFonts.montserrat(fontSize: 17),
                              ),
                            ),
                            SizedBox(
                              width: 120,
                              child: TextFormField(
                                controller: rateController,
                                style: GoogleFonts.montserrat(fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Slider(
                        value: _rateValue.toDouble(),
                        min: 0.0,
                        max: 15.0,
                        activeColor: Colors.blueAccent,
                        inactiveColor: Colors.grey,
                        label: _rateValue.round().toString(),
                        onChanged: (double newValue) {
                          setState(() {
                            _rateValue = double.parse(newValue.toStringAsFixed(2));
                            rateController.text = _rateValue.toString();
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: (){
                                  setState(() {
                                    int p = _loanAmount;
                                    int n = _tenureValue*12;
                                    double r = _rateValue/12/100;
                                    double emi =  p*r*pow(1+r, n)/ ((pow(1+r, n)-1));
                                    result = "Your monthly EMI will be Rs. " + emi.round().toString();
                                  });
                                },
                                child: const Text(
                                  'Calculate',
                                )),
                            ElevatedButton(
                              child: const Text(
                                'Get Help',
                              ),
                              onPressed: () => setState(() {
                                var _launched = launchInBrowser(widget.url);
                              }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 42,),
                        child: Text(result, style: GoogleFonts.montserrat(fontSize: 17),),
                      )
                    ],
                  )
              ),
            ])
    );
  }
}
