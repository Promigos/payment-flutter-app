import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_app/utils/colors.dart' as colors;

class PasswordFormFieldWidget extends StatefulWidget {
  const PasswordFormFieldWidget(
      {Key? key,
      this.passwordKey,
      this.controller,
      this.onSaved,
      this.style,
      this.validator,
      required this.label,
      required this.hintText})
      : super(key: key);
  final GlobalKey<FormFieldState>? passwordKey;
  final TextEditingController? controller;
  final TextStyle? style;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final String label;
  final String hintText;

  @override
  _PasswordFormFieldWidgetState createState() =>
      _PasswordFormFieldWidgetState();
}

class _PasswordFormFieldWidgetState extends State<PasswordFormFieldWidget> {
  bool setPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: !setPasswordVisible,
      key: widget.passwordKey,
      controller: widget.controller,
      validator: widget.validator,
      style: widget.style,
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        label: Text(widget.label,
            style: GoogleFonts.nunito(
                color: colors.textBoxTextColor, fontSize: 17)),
        hintText: widget.hintText,
        suffixIcon: Material(
          color: Colors.transparent,
          child: IconButton(
            color: colors.primaryTextColor,
            icon: Icon(
              setPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                setPasswordVisible = !setPasswordVisible;
              });
            },
          ),
        ),
        filled: true,
        hintStyle: GoogleFonts.poppins(
            color: colors.primaryTextColor.withOpacity(0.7)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
