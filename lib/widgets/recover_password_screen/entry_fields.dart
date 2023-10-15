import 'package:flutter/material.dart';
import 'package:smart_office/theme/custom_buttons/button_answer_poll.dart';
import 'package:smart_office/theme/custom_text_fields/custom_text_field.dart';
import 'package:smart_office/theme/theme.dart';

import 'package:smart_office/widgets/recover_password_screen/new_password.dart';
import 'package:smart_office/widgets/recover_password_screen/recover_password_screen.dart';
import 'package:smart_office/requests/auth_requests/auth_service.dart';

class RecoveryPasswordEntryFields extends StatefulWidget {
  const RecoveryPasswordEntryFields({super.key});

  @override
  State<RecoveryPasswordEntryFields> createState() {
    return _RecoveryPasswordEntryFieldsState();
  }
}

class _RecoveryPasswordEntryFieldsState
    extends State<RecoveryPasswordEntryFields> {
  _sendCodeToEmail(String email) async {
    if (email.contains('@') && email.contains('.')) {
      AuthService auth = AuthService();
      _errorText = await auth.resetPasswordCheckEmail(email);
      if (_errorText.contains('отправлен')) {
        _emailEnabled = false;
        _textFieldForCode = true;
        _errorText = '';
      }
    } else if (email.isEmpty) {
      _errorText = 'Вы не ввели почту';
    } else {
      _errorText = 'Неверный формат почты';
    }
    setState(() {});
  }

  _sendVerificationCode(BuildContext context, String email, int code) async {
    if (code > 999 && code < 10000) {
      String stringCode = code.toString();
      AuthService auth = AuthService();
      final response = await auth.resetPasswordCheckCode(email, stringCode);
      if (response == true && context.mounted) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RecoveryPasswordScreen(
                  passwordResetStage:
                      NewPassword(email: email, code: stringCode)),
            ));
      } else {
        _errorText = response;
      }
    } else {
      _errorText = 'Неверный формат кода';
    }
    setState(() {});
  }

  String _errorText = '';
  bool _textFieldForCode = false;
  bool _emailEnabled = true;
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _textFieldForCode
              ? 'Введите код подтверждения, который был отправлен на почту'
              : 'Введите вашу почту, после этого вам придёт письмо с кодом для восстановления пароля',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.purple,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (_errorText.isNotEmpty) ...[
          const SizedBox(height: 10),
          Text(_errorText, style: textStyleError)
        ],
        const SizedBox(height: 10),
        CustomTextField(
          textLabel: 'Почта',
          controller: _emailController,
          enabled: _emailEnabled,
          icon: Icons.email_outlined,
        ),
        if (_textFieldForCode) ...[
          const SizedBox(height: 10),
          CustomTextField(
            fontSize: 18,
            icon: Icons.security_rounded,
            letterSpacing: 14,
            textAlign: TextAlign.center,
            textLabel: 'Код',
            controller: _codeController,
            maxLength: 4,
            keyboardType: TextInputType.number,
          ),
        ],
        const SizedBox(height: 10),
        GradientButton(
          text: _textFieldForCode ? 'Подтвердить' : 'Отправить код',
          fontSize: 24,
          textInCenter: true,
          listColors: gradientList,
          onPressed: () {
            _textFieldForCode
                ? _sendVerificationCode(
                    context,
                    _emailController.text,
                    int.tryParse(_codeController.text) ?? 0,
                  )
                : _sendCodeToEmail(_emailController.text);
          },
          isActive: true,
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
