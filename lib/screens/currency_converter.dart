import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_sliver.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({Key? key}) : super(key: key);

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  String result = 'We make the conversions easy for you!';
  final _formKey = GlobalKey<FormState>();
  String fromDropdownValue = 'EUR-Euro';
  String toDropdownValue = 'INR-Indian Rupee';
  List<String> currency = [
    'AED-United Arab Emirates Dirham',
    'AUD-Australian Dollar',
    'CAD-Canadian Dollar',
    'EUR-Euro',
    'GBP-British Pound Sterling',
    'INR-Indian Rupee',
    'JPY-Japanese Yen',
    'KPW-North Korean Won',
    'KRW-South Korean Won',
    'KWD-Kuwaiti Dinar',
    'LKR-Sri Lankan Rupee',
    'MVR-Maldivian Rufiyaa',
    'NZD-New Zealand Dollar',
    'OMR-Omani Rial',
    'PKR-Pakistani Rupee',
    'QAR-Qatari Rial',
    'SAR-Saudi Riyal',
    'SGD-Singapore Dollar'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crypto Currency Converter"),
      ),
      body: CustomSliverView(
        columnList: [
          Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 8,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              'Amount to be converted',
                              style: GoogleFonts.montserrat(fontSize: 17),
                            ),
                          ),
                          SizedBox(
                              width: 200,
                              child: TextFormField(
                                style: GoogleFonts.montserrat(fontSize: 20),
                              )),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 8,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              'From \n(fiat currency)',
                              style: GoogleFonts.montserrat(fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: DropdownButton<String>(
                              value: fromDropdownValue,
                              // icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: GoogleFonts.montserrat(fontSize: 17),
                              underline: Container(
                                height: 2,
                                color: Colors.blueAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  fromDropdownValue = newValue!;
                                });
                              },
                              items: currency.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 8,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              'To \n(crypto currency)',
                              style: GoogleFonts.montserrat(fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            width: 200,
                            child: DropdownButton<String>(
                              value: toDropdownValue,
                              elevation: 16,
                              style: GoogleFonts.montserrat(fontSize: 17),
                              underline: Container(
                                height: 2,
                                color: Colors.blueAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  toDropdownValue = newValue!;
                                });
                              },
                              items: currency.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  List<String> curr =
                                      fromDropdownValue.split('-');
                                  List<String> cry = toDropdownValue.split('-');
                                  //  todo : api call and get results
                                });
                              },
                              child: const Text(
                                'Convert',
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 42,
                      ),
                      child: Text(
                        result,
                        style: GoogleFonts.montserrat(fontSize: 17),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
