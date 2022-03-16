import 'package:flutter/material.dart';

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
          elevation: 10,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title, style: const TextStyle(
                      fontSize: 18
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
