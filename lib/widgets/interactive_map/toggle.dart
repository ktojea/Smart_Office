import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({super.key});

  @override
  State<CustomToggleButton> createState() {
    return _CustomToggleButtonState();
  }
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  List<bool> isSelected = [
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(30),
      children: [Text('Вкл'), Text('Выкл')],
      isSelected: isSelected,
      onPressed: (int index) {
        setState(() {
          if (index == 0) {
            isSelected[0] = true;
            isSelected[1] = false;
          } else {
            isSelected[0] = false;
            isSelected[1] = true;
          }
        });
      },
    );
  }
}
