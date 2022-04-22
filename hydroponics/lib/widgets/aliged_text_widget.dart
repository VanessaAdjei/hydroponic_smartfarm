import 'package:flutter/material.dart';

class AlignedText extends StatelessWidget {
  final String text;
  final double fontSize;

  const AlignedText({
    required this.text,
    required this.fontSize,
    required Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(text,
          style: TextStyle(
              color: Color.fromRGBO(50, 50, 93, 1),
              fontSize: fontSize,
              fontWeight: FontWeight.w200)),
    );
  }
}
