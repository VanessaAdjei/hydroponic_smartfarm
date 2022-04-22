import 'package:flutter/material.dart';

class PaddedText extends StatelessWidget {
  final String text;
  final double fontSize;

  const PaddedText({
    required this.text,
    required this.fontSize,
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Align(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(82, 95, 127, 1),
              fontSize: fontSize,
              fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}
