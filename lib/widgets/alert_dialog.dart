import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

displayDialog(context, positiveText, negativeText, Function positiveFunction,
    title, subTitle,
    {dismissDialog, willPop}) {
  return showDialog(
    context: context,
    barrierDismissible: dismissDialog ?? true,
    builder: (context) => WillPopScope(
      onWillPop: () async => willPop ?? true,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: Text(
          title,
          style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
        ),
        content: Text(
          subTitle,
          style: GoogleFonts.raleway(),
        ),
        actions: <Widget>[
          negativeText != null
              ? TextButton(
            key:Key('negab'),
                  child: Text(
                    negativeText,
                    style: GoogleFonts.raleway(),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : Container(),
          ElevatedButton(
            key:Key('posab'),
            child: Text(

              positiveText,
            ),
            onPressed: () async {
              positiveFunction();
            },
          ),
        ],
      ),
    ),
  );
}

displayQuitDialog(context, title, subTitle) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Text(
        title,
        style: GoogleFonts.raleway(fontWeight: FontWeight.bold),
      ),
      content: Text(
        subTitle,
        style: GoogleFonts.raleway(),
      ),
      actions: <Widget>[
        TextButton(
          key:Key('noab'),
          child: Text(
            "No",
            style: GoogleFonts.raleway(),
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        ElevatedButton(
          key:Key('yesab'),
          child: const Text(
            "Yes",
          ),
          onPressed: () async {
            Navigator.pop(context, true);
          },
        ),
      ],
    ),
  );
}
