import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/widgets/custom_sliver.dart';
import 'package:http/http.dart' as http;

class CryptoConverter extends StatefulWidget {
  const CryptoConverter({Key? key}) : super(key: key);

  @override
  _CryptoConverterState createState() => _CryptoConverterState();
}

class _CryptoConverterState extends State<CryptoConverter> {
  late Future<Response> futureResponse;
  String result = 'We make the conversions easy for you!';
  final _formKey = GlobalKey<FormState>();
  String fromDropdownValue = 'AED-United Arab Emirates Dirham';
  String toDropdownValue = 'ADA-Cardano';
  List<String> crypto = [
    'ADA-Cardano',
    'ADCN-Asiadigicoin',
    'ADL-Adelphoi',
    'ADX-AdEx',
    'ADZ-Adzcoin',
    'AE-Aeternity',
    'BNB-Binance Coin',
    'BQX-Ethos',
    'BTC-Bitcoin',
    'BTG-Bitcoin Gold',
    'CTO-Crypto',
    'DOGE-Dogecoin',
    'ETH-Ethereum',
    'SIB-SibCoin',
    'TESLA-TeslaCoilCoin',
    'TRC-TerraCoin',
    'USDT-Tether',
    'XLM-Stellar',
    'XRB-Nano',
    'XRP-Ripple',
    'XZC-ZCoin'
  ];
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
                              items: crypto.map<DropdownMenuItem<String>>(
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
                              onPressed: () async {
                                List<String> curr =
                                    fromDropdownValue.split('-');
                                List<String> cry = toDropdownValue.split('-');
                                http.Response response = await http.get(Uri.parse(
                                    'http://api.coinlayer.com/api/live?access_key=7df28c8a855b6a9a7403e915a43003a7&target=${curr[0]}&symbols=${cry[0]}'));
                                var encodedVal = json.decode(response.body);
                                var finalConversionValue =
                                    encodedVal["rates"][cry[0]];
                                finalConversionValue = int.parse(finalConversionValue);
                                int rate = finalConversionValue;

                              },
                              child: const Text(
                                'Convert',
                              )),
                          ElevatedButton(
                            child: const Text(
                              'Get Help',
                            ),
                            onPressed: () => setState(() {
                              // todo : redirect to some crypto info page
                            }),
                          ),
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

class Response {
//  Class for holding the response returned by the api call after parsing the json
}
