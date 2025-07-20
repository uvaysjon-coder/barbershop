
import 'package:flutter/material.dart';

extension CustomContext on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
  // ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  TextTheme get text => Theme.of(this).textTheme;

  // Screen size helpers
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  // Padding bottom for safe area
  double get bottomPadding => MediaQuery.of(this).padding.bottom;

  // Status bar height
  double get topPadding => MediaQuery.of(this).padding.top;
  double get viewBottom => MediaQuery.of(this).viewInsets.bottom;
  double get viewTop => MediaQuery.of(this).viewInsets.top;

}

extension TextThemeExtension on TextTheme {

  TextStyle? get headline2 => titleLarge;
  TextStyle? get headline3 => titleMedium;
  TextStyle? get headline4 => titleSmall?.copyWith(fontWeight: FontWeight.bold,fontSize: 16.0,);
  TextStyle? get headline5 => titleSmall;
  TextStyle? get headline1 => headlineSmall;
  TextStyle? get subHeadline1 => bodyLarge?.copyWith(fontSize: 18.0,fontWeight: FontWeight.normal);
  TextStyle? get subHeadline2 => bodyLarge?.copyWith(fontSize: 16.0,fontWeight: FontWeight.w400);
  TextStyle? get subHeadline3 => bodyLarge?.copyWith(fontSize: 14.0,fontWeight: FontWeight.normal);
  TextStyle? get body1 => bodyLarge?.copyWith(fontSize: 18.0,);
  TextStyle? get body2 => bodyLarge?.copyWith(fontSize: 16.0,);
  TextStyle? get body3 => bodyLarge?.copyWith(fontSize: 14.0,);
  TextStyle? get caption1 => bodySmall;
  TextStyle? get caption2 => bodySmall?.copyWith(fontSize: 10.0,);
  TextStyle? get display1 => displaySmall;
  TextStyle? get display2 => headlineMedium;
}