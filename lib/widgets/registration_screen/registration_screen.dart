import 'package:flutter/material.dart';
import 'package:smart_office/theme/theme.dart';
import 'package:smart_office/widgets/registration_screen/data_entry_fields.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() {
    return _RegistrationScreenState();
  }
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: bgForReg,
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: SizedBox(
              child: SingleChildScrollView(
                reverse: true,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      decoration: whiteBoxDecoration,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: DataEntryFields(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom*0.6),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height*0.1),
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
