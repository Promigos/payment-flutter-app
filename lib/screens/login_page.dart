import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/screens/home_page.dart';
import 'package:payment_app/utils/colors.dart' as colors;
import 'package:payment_app/utils/constants.dart' as constants;

import '../widgets/custom_sliver.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  String error = "";

  bool showProgress = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
        children:[
          Container(
            color: colors.scaffoldColor,
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
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
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome',
                                  style: GoogleFonts.nunito(
                                    color: colors.primaryTextColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                Padding(
                                    padding:
                                    const EdgeInsets.only(top: 1, bottom: 20),
                                    child: Text(
                                      'Login to APP NAME',
                                      style: GoogleFonts.nunito(
                                        color: colors.primaryTextColor,
                                        fontSize: 16,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: constants.textFieldPadding,
                          child: TextFormField(
                              controller: _nameController,
                              style: GoogleFonts.montserrat(
                                  color: colors.primaryTextColor),
                              validator: (value) {
                                if (value == "" || value == null) {
                                  return "Cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                label: Text('Phone number or Email ID',
                                    style: GoogleFonts.nunito(
                                        color: colors.textBoxTextColor,
                                        fontSize: 17)),
                                filled: true,
                                hintText: 'Enter your phone number or Email ID',
                                hintStyle: GoogleFonts.poppins(
                                    color:
                                    colors.textBoxTextColor),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                                fillColor: colors.textBoxColor,
                                focusColor: colors.textBoxColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                              )),
                        ),
                        Padding(
                          padding: constants.textFieldPadding,
                          child: TextFormField(
                              controller: _nameController,
                              style: GoogleFonts.montserrat(
                                  color: colors.primaryTextColor),
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
                                        color: colors.textBoxTextColor,
                                        fontSize: 17)),
                                filled: true,
                                hintText: 'Enter Password',
                                hintStyle: GoogleFonts.poppins(
                                    color: colors.textBoxTextColor),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                                fillColor: colors.textBoxColor,
                                focusColor: colors.textBoxColor,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(5)),
                              )),
                        ),
                        Padding(
                          padding: constants.textFieldPadding,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: colors.alternateButtonColor),
                              child: Text('LOG IN', style: constants.alternateIconTextStyle,),
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));
                              },
                            ),
                          ),
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
