import 'package:flutter/widgets.dart';
import 'package:smart_office/theme/custom_text_fields/custom_text_field.dart';
import 'package:smart_office/theme/theme.dart';

class UserAnswerWidget extends StatefulWidget {
  const UserAnswerWidget({super.key});

  @override
  State<UserAnswerWidget> createState() {
    return _UserAnswerWidgetState();
  }
}

class _UserAnswerWidgetState extends State<UserAnswerWidget> {

  final _textfieldContent = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: whiteBoxDecoration,
      child: Column(children: [
        CustomTextField(
              textLabel: 'Вашe решение',
              maxLines: 12,
              controller: _textfieldContent,
            ),
      ]),
    );
  }
}