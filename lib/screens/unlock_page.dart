import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/widgets/custom_sliver.dart';
import 'package:payment_app/utils/constants.dart' as constants;

import 'home_page.dart';

class UnlockPage extends StatefulWidget {
  late String userName = "User";
  UnlockPage({Key? key}) : super(key: key);

  @override
  _UnlockPageState createState() => _UnlockPageState();
}

class _UnlockPageState extends State<UnlockPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Container(),
          Scaffold(
              body: CustomSliverView(
                columnList: [
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 30),
                          child: Text(
                            'Welcome ${widget.userName}',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Padding(
                          padding: constants.textFieldPadding,
                          child: TextFormField(
                              style: GoogleFonts.montserrat(),
                              validator: (value) {
                                if (value == "" || value == null) {
                                  return "Password cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                label: Text('Password',
                                    style: GoogleFonts.nunito(
                                      // color: colors.textBoxTextColor,
                                        fontSize: 17)),
                                filled: true,
                                hintText: 'Enter Password',
                                hintStyle: GoogleFonts.poppins(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                                // fillColor: colors.textBoxColor,
                                // focusColor: colors.textBoxColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                              )),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: constants.textFieldPadding,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(),
                                  child: const Text('Finger Print',),
                                  onPressed: (){

                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: constants.textFieldPadding,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(),
                                  child: const Text('UNLOCK',),
                                  onPressed: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 1, child: Container())
                ],
              ))
        ]
    );
  }
}
