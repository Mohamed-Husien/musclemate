import 'package:flutter/material.dart';

abstract class TextStyles {
  static TextStyle styleRobotoBold11(context) {
    return TextStyle(
      color: const Color(0xFF064060),
      fontSize: getResponsiveFontSize(context, fontSize: 11),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700, // Bold
    );
  }

  static TextStyle styleRoboto16(context) {
    return TextStyle(
      color: const Color(0xFF064060),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400, // Bold
    );
  }

  static TextStyle styleRobotoMedum25(context) {
    return TextStyle(
      color: const Color(0xFF064060),
      fontSize: getResponsiveFontSize(context, fontSize: 25),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500, // Bold
    );
  }

  static TextStyle styleRobotoRegular20(context) {
    return TextStyle(
      color: const Color(0xFF064060),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400, // Regular
    );
  }

  static TextStyle styleAmiriBold39_9(context) {
    return TextStyle(
      color: const Color(0xFF064060),
      fontSize: getResponsiveFontSize(context, fontSize: 39.9),
      fontFamily: 'Amiri',
      fontWeight: FontWeight.w700, // Bold
    );
  }

  static TextStyle styleAmiriBold28(context) {
    return TextStyle(
      color: const Color(0xFF064060),
      fontSize: getResponsiveFontSize(context, fontSize: 28),
      fontFamily: 'Amiri',
      fontWeight: FontWeight.w700, // Bold
    );
  }

  static TextStyle styleAmiriBold40(context) {
    return TextStyle(
      color: const Color(0xFF064060),
      fontSize: getResponsiveFontSize(context, fontSize: 40),
      fontFamily: 'Amiri',
      fontWeight: FontWeight.w700, // Bold
    );
  }

  static TextStyle styleRobotoMedium20(context) {
    return TextStyle(
      color: const Color(0xFF064060),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500, // Medium
    );
  }

  static TextStyle styleRoboto20(context) {
    return TextStyle(
      color: const Color(0xFF064060),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700, // Medium
    );
  }

  static TextStyle styleRoboto15(context) {
    return TextStyle(
      color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 15),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700, // Medium
    );
  }

  static TextStyle styleLeague24(context) {
    return TextStyle(
      color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'League Spartan',
      fontWeight: FontWeight.w600, // Medium
    );
  }

  static TextStyle styleLeague20(context) {
    return TextStyle(
      color: Colors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'League Spartan',
      fontWeight: FontWeight.w700, // Medium
    );
  }

  static TextStyle styleLeague25(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 25),
      fontFamily: 'League Spartan',
      fontWeight: FontWeight.w600,
      height: 0.04,
      letterSpacing: -0.12, // Medium
    );
  }

  static TextStyle stylePoppins24(context) {
    return TextStyle(
      color: Colors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      height: 0,
      letterSpacing: 1.68,
// Medium
    );
  }

  static TextStyle stylePoppins16(context) {
    return TextStyle(
      color: Colors.black.withOpacity(0.3499999940395355),
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      height: 0,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 400) {
    // SizeConfig.tablet
    return width / 550;
  } else if (width < 700) {
    //SizeConfig.desktop
    return width / 1000;
  } else {
    return width / 1920;
  }
}
