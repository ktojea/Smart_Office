import 'package:flutter/material.dart';
import 'package:smart_office/widgets/auth_screen/auth_screen.dart';
import 'dart:io';


class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Умный офис',
      home: const AuthScreen(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    );
  }
}
