import 'package:flutter/material.dart';

const Color cardColor = Color(0xFF141A3C);

class MyCard extends StatelessWidget {
  MyCard({
    required this.margin,
    this.color = cardColor,
    required this.borderRadius,
    this.child,
    required this.onPressed,
    this.borderColor = Colors.white,
    this.text = '',
  });

  final child;
  final EdgeInsets margin;
  final Color color;
  final BorderRadius borderRadius;
  final VoidCallback onPressed;
  final Color borderColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
        margin: margin,
        decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
            border: Border.fromBorderSide(
                BorderSide(color: borderColor, width: 1))),
      ),
    );
  }
}
