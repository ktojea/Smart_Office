import 'package:flutter/material.dart';
import 'package:smart_office/theme/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.textLabel,
    this.icon,
    this.obscureText = false,
    this.onChanged,
    this.enabled = true,
    this.keyboardType,
    this.maxLength,
    this.fontSize = 16,
    this.letterSpacing,
    this.textAlign = TextAlign.start,
    this.color = AppColors.purple,
    this.maxLines = 1,
    this.enabledColor,
    this.iconColor,
  });

  final String textLabel;
  final bool obscureText;
  final TextEditingController controller;
  final IconData? icon;
  final void Function(String)? onChanged;
  final bool enabled;
  final TextInputType? keyboardType;
  final int? maxLength;  
  final double fontSize;
  final double? letterSpacing;
  final TextAlign textAlign;
  final Color color;
  final int maxLines;
  final Color? enabledColor;
  final Color? iconColor;


  @override
  Widget build(BuildContext context) {
    return TextField(
      minLines: 1,
      maxLines: maxLines,
      textAlign: textAlign,
      enabled: enabled,
      keyboardType: keyboardType,
      maxLength: maxLength,
      onChanged: onChanged,
      style: TextStyle(
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontWeight: FontWeight.w500,
        color: color,
      ),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        counterText: '',
        prefixIcon: icon!=null ? Icon(icon, color: iconColor ?? Colors.grey,) : null,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: enabledColor ?? Colors.grey, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: color, width: 3),
        ),
        labelText: textLabel,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        floatingLabelStyle: TextStyle(
          color: color,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
