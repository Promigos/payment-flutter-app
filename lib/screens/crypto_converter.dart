import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/widgets/custom_sliver.dart';


class CryptoConverter extends StatefulWidget {
  const CryptoConverter({Key? key}) : super(key: key);

  @override
  _CryptoConverterState createState() => _CryptoConverterState();
}

class _CryptoConverterState extends State<CryptoConverter> {
  String result = 'We make the conversions easy for you!';
  final _formKey = GlobalKey<FormState>();
  String FromdropdownValue = 'One';
  String TodropdownValue = 'One1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crypto Currency Converter"),
      ),
      body: CustomSliverView(
        columnList: [
          Form(
              key : _formKey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 8,),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              'Amount to be converted',
                              style: GoogleFonts.montserrat(fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: TextFormField(
                              style: GoogleFonts.montserrat(fontSize: 20),
                            )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 8,),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              'From \n(fiat currency)',
                              style: GoogleFonts.montserrat(fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: DropdownButton<String>(
                              value: FromdropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: GoogleFonts.montserrat(fontSize: 17),
                              underline: Container(
                                height: 2,
                                color: Colors.blueAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  FromdropdownValue = newValue!;
                                });
                              },
                              items: <String>['One', 'Two', 'Three', 'Four']
                                  .map<DropdownMenuItem<String>>((String value) {
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
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 8,),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              'To \n(crypto currency)',
                              style: GoogleFonts.montserrat(fontSize: 17),
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: DropdownButton<String>(
                              value: TodropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: GoogleFonts.montserrat(fontSize: 17),
                              underline: Container(
                                height: 2,
                                color: Colors.blueAccent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  TodropdownValue = newValue!;
                                });
                              },
                              items: <String>['One1', 'Two1', 'Three1', 'Four1']
                                  .map<DropdownMenuItem<String>>((String value) {
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
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                setState(() {});
                              },
                              child: const Text(
                                'Calculate',
                              )),
                          ElevatedButton(
                            child: const Text(
                              'Get Help',
                            ),
                            onPressed: () => setState(() {}),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 42,),
                      child: Text(result, style: GoogleFonts.montserrat(fontSize: 17),),
                    )
                  ],
                ),
              ))
        ],),
    );
  }
}
