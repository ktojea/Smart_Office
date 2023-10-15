import 'package:flutter/material.dart';

import 'package:smart_office/models/registration/registration_data_model.dart';
import 'package:smart_office/requests/auth_requests/auth_service.dart';
import 'package:smart_office/theme/custom_buttons/button_answer_poll.dart';
import 'package:smart_office/theme/custom_text_fields/custom_text_field.dart';
import 'package:smart_office/theme/theme.dart';

class DataEntryFields extends StatefulWidget {
  const DataEntryFields({super.key});

  @override
  State<DataEntryFields> createState() {
    return _DataEntryFieldsState();
  }
}

class _DataEntryFieldsState extends State<DataEntryFields> {
  final Map<String, TextEditingController> textFields = {
    'Имя': TextEditingController(),
    'Фамилия': TextEditingController(),
    'Почта': TextEditingController(),
    'Пароль': TextEditingController(),
    'Повторите пароль': TextEditingController(),
  };

  String errorText = '';

  _checkCorrectness(data) {
    bool isLettersOnly(String str) {
      RegExp regExp = RegExp(r'^[a-zA-Zа-яА-Я]+$');
      return regExp.hasMatch(str);
    }

    if (data['Имя'].text != '' && !isLettersOnly(data['Имя'].text)) {
      errorText = 'В имени должны быть только буквы';
    } else if (data['Фамилия'].text != '' &&
        !isLettersOnly(data['Фамилия'].text)) {
      errorText = 'В фамилии должны быть только буквы';
    } else if (data['Почта'].text != '' &&
        (!data['Почта'].text.contains('@') ||
            !data['Почта'].text.contains('.'))) {
      errorText = 'Вы указали неправильный формат почты';
    } else {
      errorText = '';
    }
    setState(() {});
  }

  _sendRegistrationData(data) async {
    if (data['Имя'].text != '' &&
        data['Фамилия'].text != '' &&
        data['Почта'].text != '' &&
        data['Пароль'].text != '' &&
        data['Почта'].text.contains('@') &&
        data['Пароль'].text == data['Повторите пароль'].text) {
      RegistrationData dataForReg = RegistrationData(
        name: data['Имя'].text,
        surname: data['Фамилия'].text,
        email: data['Почта'].text,
        password: data['Пароль'].text,
      );
      AuthService auth = AuthService();
      errorText = await auth.regUser(dataForReg);
    } else if (data['Пароль'].text != data['Повторите пароль'].text) {
      errorText = 'Пароли не совпадают';
    } else {
      errorText = 'Есть пустые поля';
    }
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (errorText != '') ...[
          Text(
            errorText,
            style: textStyleError,
          ),
          const SizedBox(height: 10),
        ],
        const Text(
          'Регистрация',
          style: TextStyle(
            color: AppColors.purple,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextField(
            controller: textFields['Имя']!,
            textLabel: 'Имя',
            icon: Icons.person_2_outlined,
            onChanged: (t) {
              _checkCorrectness(textFields);
            }),
        const SizedBox(height: 10),
        CustomTextField(
            controller: textFields['Фамилия']!,
            textLabel: 'Фамилия',
            icon: Icons.group_outlined,
            onChanged: (t) {
              _checkCorrectness(textFields);
            }),
        const SizedBox(height: 10),
        CustomTextField(
            controller: textFields['Почта']!,
            textLabel: 'Почта',
            icon: Icons.email_outlined,
            onChanged: (t) {
              _checkCorrectness(textFields);
            }),
        const SizedBox(height: 10),
        CustomTextField(
          controller: textFields['Пароль']!,
          textLabel: 'Пароль',
          icon: Icons.lock_open_outlined,
          obscureText: true,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: textFields['Повторите пароль']!,
          textLabel: 'Повторите пароль',
          icon: Icons.lock_outline,
          obscureText: true,
        ),
        const SizedBox(height: 10),
        GradientButton(
          text: 'Зарегистрироваться',
          fontSize: 24,
          isActive: true,
          listColors: gradientList,
          textInCenter: true,
          onPressed: () {
            _sendRegistrationData(textFields);
          },
        ),
        TextButton.icon(
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.purple,),
          label: const Text(
            'Есть аккаунт? Войдите',
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
