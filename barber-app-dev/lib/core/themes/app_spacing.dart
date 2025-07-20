
// lib/theme/app_spacing.dart
import 'package:flutter/material.dart';

abstract final  class AppSpacing {

  // EdgeInsets - All sides
  static const EdgeInsets a4 = EdgeInsets.all(4);
  static const EdgeInsets a8 = EdgeInsets.all(8);
  static const EdgeInsets a10 = EdgeInsets.all(10);
  static const EdgeInsets a12 = EdgeInsets.all(12);
  static const EdgeInsets a16 = EdgeInsets.all(16);
  static const EdgeInsets a20 = EdgeInsets.all(20);
  static const EdgeInsets a24 = EdgeInsets.all(24);
  static const EdgeInsets a32 = EdgeInsets.all(32);

  // EdgeInsets - Horizontal
  static const EdgeInsets h4 = EdgeInsets.symmetric(horizontal: 4);
  static const EdgeInsets h8 = EdgeInsets.symmetric(horizontal: 8);
  static const EdgeInsets h12 = EdgeInsets.symmetric(horizontal: 12);
  static const EdgeInsets h16 = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets h20 = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets h24 = EdgeInsets.symmetric(horizontal: 24);
  static const EdgeInsets h32 = EdgeInsets.symmetric(horizontal: 32);

  // EdgeInsets - Vertical
  static const EdgeInsets v4 = EdgeInsets.symmetric(vertical: 4);
  static const EdgeInsets v8 = EdgeInsets.symmetric(vertical: 8);
  static const EdgeInsets v12 = EdgeInsets.symmetric(vertical: 12);
  static const EdgeInsets v16 = EdgeInsets.symmetric(vertical: 16);
  static const EdgeInsets v20 = EdgeInsets.symmetric(vertical: 20);
  static const EdgeInsets v24 = EdgeInsets.symmetric(vertical: 24);
  static const EdgeInsets v32 = EdgeInsets.symmetric(vertical: 32);

  // Custom Spacing
  static const EdgeInsets zero = EdgeInsets.zero;

  static const EdgeInsets a10_16 = EdgeInsets.symmetric(horizontal: 10, vertical: 8);
  static const EdgeInsets r4_l0 = EdgeInsets.only( right: 4);
  static const EdgeInsets a10_4 = EdgeInsets.symmetric(horizontal: 10, vertical: 4);
  static const EdgeInsets a12_8 = EdgeInsets.symmetric(horizontal: 12, vertical: 8);

}