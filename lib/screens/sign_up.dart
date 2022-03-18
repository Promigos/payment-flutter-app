import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/utils/colors.dart' as colors;
import 'package:payment_app/utils/constants.dart' as constants;
import '../widgets/custom_sliver.dart';
import 'home_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailIDController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          // color: colors.scaffoldColor,
          ),
      Scaffold(
          // backgroundColor: Colors.transparent,
          body: CustomSliverView(
        columnList: [
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container())),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 80, bottom: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: GoogleFonts.nunito(
                            // color: colors.primaryTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 1, bottom: 20),
                            child: Text(
                              'Register with APP NAME',
                              style: GoogleFonts.nunito(
                                // color: colors.primaryTextColor,
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
                      // controller: _nameController,
                      style: GoogleFonts.montserrat(),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Please enter a valid name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        label: Text('Name',
                            style: GoogleFonts.nunito(
                                // color: colors.textBoxTextColor,
                                fontSize: 17)),
                        filled: true,
                        hintText: 'Enter your name',
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
                Padding(
                  padding: constants.textFieldPadding,
                  child: TextFormField(
                      // controller: _nameController,
                      style: GoogleFonts.montserrat(),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Please enter a valid phone number";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        label: Text('Phone number',
                            style: GoogleFonts.nunito(fontSize: 17)),
                        filled: true,
                        hintText: 'Enter your phone number',
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
                Padding(
                  padding: constants.textFieldPadding,
                  child: TextFormField(
                      // controller: _nameController,
                      style: GoogleFonts.montserrat(),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Please enter a valid email id";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        label: Text('Email ID',
                            style: GoogleFonts.nunito(fontSize: 17)),
                        filled: true,
                        hintText: 'Enter your Email ID',
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
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 10, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                            maxLength: 6,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            controller: _passwordController,
                            validator: (value) {
                              if (value == "" || value == null) {
                                return "Enter Password";
                              } else {
                                return null;
                              }
                            },
                            style: GoogleFonts.nunito(fontSize: 17),
                            decoration: InputDecoration(
                              label: Text('Password',
                                  style: GoogleFonts.nunito(
                                      // color: colors.textBoxTextColor,
                                      fontSize: 17)),
                              filled: true,
                              hintText: 'Enter password',
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
                      SizedBox(
                        width: 170,
                        child: TextFormField(
                            maxLength: 6,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            controller: _passwordController,
                            validator: (value) {
                              if (value == "" || value == null) {
                                return "Enter password";
                              } else {
                                return null;
                              }
                            },
                            style: GoogleFonts.nunito(fontSize: 17),
                            decoration: InputDecoration(
                              label: Text('Re-enter Password',
                                  style: GoogleFonts.nunito(
                                      // color: colors.textBoxTextColor,
                                      fontSize: 17)),
                              filled: true,
                              hintText: 'Re-enter Password',
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
                    ],
                  ),
                ),
                Padding(
                  padding: constants.textFieldPadding,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      child: const Text(
                        'Send OTP',
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30.0, bottom: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 200,
                        child: TextFormField(
                            maxLength: 6,
                            keyboardType:
                                const TextInputType.numberWithOptions(),
                            // controller: _passwordController,
                            validator: (value) {
                              if (value == "" || value == null) {
                                return "Enter OTP";
                              } else {
                                return null;
                              }
                            },
                            style: GoogleFonts.nunito(fontSize: 17),
                            decoration: InputDecoration(
                              label: Text('OTP',
                                  style: GoogleFonts.nunito(
                                      // color: colors.textBoxTextColor,
                                      fontSize: 17)),
                              filled: true,
                              hintText: 'Enter OTP',
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
                      ElevatedButton(
                          onPressed: () {},
                          child: const SizedBox(
                              height: 40,
                              child: Center(child: Text('Verify OTP'))))
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(flex: 1, child: Container())
        ],
      ))
    ]);
  }
}
