import 'package:flutter/material.dart';

import 'package:smart_office/theme/theme.dart';
import 'package:smart_office/widgets/auth_screen/entry_fields.dart';
import 'package:smart_office/widgets/recover_password_screen/entry_fields.dart';
import 'package:smart_office/widgets/recover_password_screen/recover_password_screen.dart';
import 'package:smart_office/widgets/registration_screen/registration_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(image: bgForAuth, fit: BoxFit.cover)),
          child: SizedBox(
            height: double.infinity,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    decoration: whiteBoxDecoration,
                    child: Column(
                      children: [
                        const Text(
                          'Добро пожаловать!',
                          style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const AuthEntryFields(),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RecoveryPasswordScreen(
                                  passwordResetStage:
                                      RecoveryPasswordEntryFields(),
                                ),
                              ),
                            );
                          },
                          style: const ButtonStyle(
                              padding:
                                  MaterialStatePropertyAll(EdgeInsets.zero)),
                          child: const Text(
                            'Забыли пароль?',
                            style: TextStyle(
                              color: AppColors.purple,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Еще нет аккаунта?',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationScreen(),
                                  ),
                                );
                              },
                              style: const ButtonStyle(
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.zero)),
                              child: const Text(
                                'Регистрация',
                                style: TextStyle(
                                  color: AppColors.purple,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              MediaQuery.of(context).viewInsets.bottom * 0.6)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
