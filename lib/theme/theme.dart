import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

const bgForPollTopic = Svg('assets/svg/bgForPollTopic.svg');
const bgForAuth = Svg('assets/svg/bgForAuth.svg');
const bgForReg = Svg('assets/svg/bgForReg.svg');
const bgForProblems = Svg('assets/svg/bgForProblems.svg');
const bgForPollTopicWidget = Svg('assets/svg/bgForPollTopicWidget.svg');
const bgForFavourites = Svg('assets/svg/bgForFavourites.svg');
const bgForPomodoro = Svg('assets/svg/bgForPomodoro.svg');
const bgForSmartOfficeWidget = Svg('assets/svg/bgForSmartOfficeWidget.svg');
const bgForAddProblemOrSolution = Svg('assets/svg/bgForAddProblemOrSolution.svg');
const bgForMap = 'assets/svg/bgForMap.svg';


const titleSmartOffice = 'assets/svg/titleSmartOffice.png';

const gradientList = [AppColors.red, AppColors.purple];

abstract class AppColors {
  static const red = Color.fromRGBO(237, 28, 28, 1);
  static const purple = Color.fromRGBO(142, 30, 98, 1);
  static const cyan = Color.fromRGBO(19, 78, 94, 1);
}

BoxDecoration whiteBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: const BorderRadius.all(Radius.circular(30)),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.25),
      blurRadius: 30,
      spreadRadius: 0,
    )
  ],
);

TextStyle textStyleQuestion = const TextStyle(
  color: AppColors.purple,
  fontSize: 20,
  fontWeight: FontWeight.w600,
  overflow: TextOverflow.ellipsis,
);

TextStyle textStyleError = const TextStyle(
  color: AppColors.red,
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

TextStyle textStyleAbout = const TextStyle(
  color: AppColors.purple,
  fontSize: 14,
  fontWeight: FontWeight.w500,
  overflow: TextOverflow.ellipsis,
);

ButtonStyle styleNavigationButtonOnMainScreen = const ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(Colors.white),
  foregroundColor: MaterialStatePropertyAll(AppColors.purple),
  padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
);
