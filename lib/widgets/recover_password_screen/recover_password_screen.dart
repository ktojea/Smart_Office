import 'package:flutter/material.dart';
import 'package:smart_office/theme/theme.dart';

class RecoveryPasswordScreen extends StatefulWidget {
  const RecoveryPasswordScreen({
    super.key,
    required this.passwordResetStage,
  });

  final Widget passwordResetStage;

  @override
  State<RecoveryPasswordScreen> createState() {
    return _RecoverPasswordScreenState();
  }
}

class _RecoverPasswordScreenState extends State<RecoveryPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              image: DecorationImage(image: bgForAuth, fit: BoxFit.cover)),
          child: SafeArea(
            child: SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      decoration: whiteBoxDecoration,
                      child: SizedBox(child: widget.passwordResetStage),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom*0.5)),
                    SizedBox(height: MediaQuery.of(context).size.height*0.22),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
