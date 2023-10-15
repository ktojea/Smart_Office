import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:smart_office/requests/auth_requests/auth_service.dart';
import 'package:smart_office/theme/custom_buttons/button_answer_poll.dart';
import 'package:smart_office/theme/custom_text_fields/custom_text_field.dart';
import 'package:smart_office/theme/theme.dart';
import 'package:smart_office/widgets/main_screen/main_screen.dart';

class AuthEntryFields extends StatefulWidget {
  const AuthEntryFields({super.key});

  @override
  State<AuthEntryFields> createState() {
    return _AuthEntryFieldsState();
  }
}

class _AuthEntryFieldsState extends State<AuthEntryFields> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _errorText = '';

  _auth(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      _errorText = 'У вас есть пустые поля';
    } else if (email.isNotEmpty &&
        (!email.contains('@') || !email.contains('.'))) {
      _errorText = 'Введите корректную почту';
    } else {
      AuthService auth = AuthService();
      String response = await auth.signInUser(email, password);
      if (response.contains('Успешный вход')) {
        if (!context.mounted) return;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainScreen(),
            ));
        _errorText = response;
        debugPrint(response);
      } else {
        _errorText = response;
      }
    }
    setState(() {});
  }

  Future _authCheckSaved() async {
    var prefs = await SharedPreferences.getInstance();
    _emailController.text = prefs.getString('email') ?? '';
    _passwordController.text = prefs.getString('password') ?? '';
  }

  @override
  void initState() {
    super.initState();
    _authCheckSaved();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (_errorText.isNotEmpty) ...[
        Text(_errorText, style: textStyleError),
        const SizedBox(
          height: 10,
        )
      ],
      CustomTextField(
        icon: Icons.email_outlined,
        controller: _emailController,
        textLabel: 'Почта',
      ),
      const SizedBox(height: 10),
      CustomTextField(
        icon: Icons.lock_outline_rounded,
        controller: _passwordController,
        textLabel: 'Пароль',
        obscureText: true,
      ),
      const SizedBox(height: 10),
      GradientButton(
        text: 'Войти',
        fontSize: 24,
        isActive: true,
        listColors: gradientList,
        textInCenter: true,
        onPressed: () {
          _auth(_emailController.text, _passwordController.text);
        },
      ),
    ]);
  }
}
