import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String title;
  HeaderText(this.title);
  @override
  Widget build(BuildContext context) {
    return Text(
              title,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.white,
                  letterSpacing: 0.414118),
            );
  }
}
