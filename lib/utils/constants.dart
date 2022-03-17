import 'package:flutter/material.dart';
import 'colors.dart' as colors;
import 'package:google_fonts/google_fonts.dart';

const String networkAddress = 'amritotsavam-api.herokuapp.com';
const bool isHTTPS = true;
const String storageJWTKey = "USER_AUTH_JWT";
const String nameKey = "USER_NAME";
const String roleKey = "USER_ROLE";
const String dateRegistered = "USER_REGISTER_DATE";
const String emailIdKey = "USER_EMAIL";
const String userIdKey = "USER_ID";
const textFieldPadding =
EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10);


var alternateIconTextStyle = GoogleFonts.nunito(color: colors.primaryTextColor, fontWeight: FontWeight.bold, fontSize: 17);
var iconTextStyle = GoogleFonts.nunito(color: colors.alternateButtonColor, fontWeight: FontWeight.bold, fontSize: 17);

var textNormalStyle = GoogleFonts.nunito(color: colors.primaryTextColor, fontSize: 17);