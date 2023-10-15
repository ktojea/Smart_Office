import 'package:flutter/material.dart';

import 'package:smart_office/requests/auth_requests/auth_service.dart';
import 'package:smart_office/theme/custom_buttons/button_answer_poll.dart';
import 'package:smart_office/theme/custom_text_fields/custom_text_field.dart';
import 'package:smart_office/theme/theme.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({
    super.key,
    required this.email,
    required this.code,
  });

  final String email;
  final String code;

  @override
  State<NewPassword> createState() {
    return _NewPasswordState();
  }
}

class _NewPasswordState extends State<NewPassword> {
  _sendNewPassword(
      String email, String code, String password, String repeatPessword) async {
    if (email.isNotEmpty &&
        code.isNotEmpty &&
        password.isNotEmpty &&
        repeatPessword.isNotEmpty) {
      if (password == repeatPessword) {
        _errorText = await AuthService().resetPassword(email, password, code);
        _enabledTextField = false;
      } else {
        _errorText = 'Пароли не совпадают';
      }
    } else {
      _errorText = 'Есть пустые поля';
    }
    setState(() {});
  }

  final _newPasswordController = TextEditingController();
  final _repeatNewPasswordController = TextEditingController();
  bool _enabledTextField = true;
  String _errorText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_errorText.isNotEmpty)
          Text(
            _errorText,
            style: textStyleError,
          ),
        CustomTextField(
          textLabel: 'Новый пароль',
          icon: Icons.lock_open_outlined,
          controller: _newPasswordController,
          obscureText: true,
          enabled: _enabledTextField,
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
          textLabel: 'Повторите пароль',
          icon: Icons.lock_outline,
          controller: _repeatNewPasswordController,
          obscureText: true,
          enabled: _enabledTextField,
        ),
        const SizedBox(
          height: 10,
        ),
        if (_enabledTextField)
          GradientButton(
            text: 'Сохранить',
            isActive: true,
            fontSize: 24,
            textInCenter: true,
            listColors: gradientList,
            onPressed: () {
              _sendNewPassword(
                  widget.email,
                  widget.code,
                  _newPasswordController.text,
                  _repeatNewPasswordController.text);
            },
          ),
        TextButton.icon(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: AppColors.purple,
          ),
          label: const Text(
            'Вернуться обратно',
            style: TextStyle(
              color: AppColors.purple,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
