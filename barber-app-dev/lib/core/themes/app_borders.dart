// lib/theme/app_borders.dart
import 'package:flutter/material.dart';

import 'app_size.dart';

abstract class AppBorders {
  static BorderRadius get r4 => BorderRadius.circular(AppSizes.r4);

  static BorderRadius get r8 => BorderRadius.circular(AppSizes.r8);

  static BorderRadius get r12 => BorderRadius.circular(AppSizes.r12);

  static BorderRadius get r16 => BorderRadius.circular(AppSizes.r16);

  static BorderRadius get r20 => BorderRadius.circular(AppSizes.r20);

  static BorderRadius get r24 => BorderRadius.circular(AppSizes.r24);

  static BorderRadius get r32 => BorderRadius.circular(AppSizes.r32);

  // Top only
  static BorderRadius get t4 =>
      const BorderRadius.vertical(top: Radius.circular(AppSizes.r4));

  static BorderRadius get t8 =>
      const BorderRadius.vertical(top: Radius.circular(AppSizes.r8));

  static BorderRadius get t12 =>
      const BorderRadius.vertical(top: Radius.circular(AppSizes.r12));

  static BorderRadius get t16 =>
      const BorderRadius.vertical(top: Radius.circular(AppSizes.r16));

  static BorderRadius get t20 =>
      const BorderRadius.vertical(top: Radius.circular(AppSizes.r20));

  static BorderRadius get t24 =>
      const BorderRadius.vertical(top: Radius.circular(AppSizes.r24));

  static BorderRadius get t32 =>
      const BorderRadius.vertical(top: Radius.circular(AppSizes.r32));

  // Bottom only
  static BorderRadius get b4 =>
      const BorderRadius.vertical(bottom: Radius.circular(AppSizes.r4));

  static BorderRadius get b8 =>
      const BorderRadius.vertical(bottom: Radius.circular(AppSizes.r8));

  static BorderRadius get b12 =>
      const BorderRadius.vertical(bottom: Radius.circular(AppSizes.r12));

  static BorderRadius get b16 =>
      const BorderRadius.vertical(bottom: Radius.circular(AppSizes.r16));

  static BorderRadius get b20 =>
      const BorderRadius.vertical(bottom: Radius.circular(AppSizes.r20));

  static BorderRadius get b24 =>
      const BorderRadius.vertical(bottom: Radius.circular(AppSizes.r24));

  static BorderRadius get b32 =>
      const BorderRadius.vertical(bottom: Radius.circular(AppSizes.r32));

  // top left and right

  static BorderRadius get tl4 => const BorderRadius.only(
      topLeft: Radius.circular(AppSizes.r4),
      topRight: Radius.circular(AppSizes.r4));

  static BorderRadius get tl8 => const BorderRadius.only(
      topLeft: Radius.circular(AppSizes.r8),
      topRight: Radius.circular(AppSizes.r8));

  static BorderRadius get tl12 => const BorderRadius.only(
      topLeft: Radius.circular(AppSizes.r12),
      topRight: Radius.circular(AppSizes.r12));

  static BorderRadius get tl16 => const BorderRadius.only(
      topLeft: Radius.circular(AppSizes.r16),
      topRight: Radius.circular(AppSizes.r16));

  static BorderRadius get tl20 => const BorderRadius.only(
      topLeft: Radius.circular(AppSizes.r20),
      topRight: Radius.circular(AppSizes.r20));

  static BorderRadius get tl24 => const BorderRadius.only(
      topLeft: Radius.circular(AppSizes.r24),
      topRight: Radius.circular(AppSizes.r24));
}
