import 'package:flutter/material.dart';
import 'package:payment_app/utils/colors.dart' as colors;

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key, required this.title, required this.icon, required this.onClick})
      : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: double.maxFinite,
        child: Card(
          color: Color(0xff93A0D0),
          elevation: 0,
          child: InkWell(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(title, style: TextStyle(
                      fontSize: 22,
                      color: colors.primaryTextColor,
                      fontWeight: FontWeight.w600
                    ),),
                  )
                ],
              ),
            ),
            onTap: onClick,
          ),
        ),
      ),
    );
  }
}
