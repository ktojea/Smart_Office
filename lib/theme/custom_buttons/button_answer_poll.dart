import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    required this.text,
    required this.fontSize,
    required this.listColors,
    required this.onPressed,
    required this.isActive,
    this.textInCenter = false,
  }) : textColor = isActive ? Colors.white : Colors.grey;

  final String text;
  final double fontSize;
  final Color textColor;
  final List<Color> listColors;
  final VoidCallback onPressed;
  final bool isActive;
  final bool textInCenter;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isActive ? listColors : [Colors.white, Colors.white],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey,
              width: isActive ? 0 : 1,
            )),
        child: Text(
          text,
          textAlign: textInCenter ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
