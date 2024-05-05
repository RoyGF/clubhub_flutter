import 'package:flutter/material.dart';

extension CustomappText on TextTheme {
  TextStyle get appTitle1 {
    return const TextStyle(
      fontSize: 24.0,
      height: 1.25,
    );
  }

  TextStyle get appTitle2 {
    return const TextStyle(
      fontSize: 20.0,
      height: 1.25,
    );
  }

  TextStyle get appBody1 {
    return const TextStyle(
      fontSize: 14.0,
      height: 1.2,
      fontFamily: 'Gilroy Medium',
    );
  }

  TextStyle get appDialogTitle {
    return const TextStyle(
      fontSize: 28.0,
      height: 1.14,
      fontWeight: FontWeight.w700,
    );
  }
}
