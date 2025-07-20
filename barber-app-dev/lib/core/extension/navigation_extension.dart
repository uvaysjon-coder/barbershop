// lib/core/extensions/navigation_extensions.dart

import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  // Метод для push с анимацией
  Future<T?> pushWithSlide<T extends Object?>({
    required Widget page,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
  }) {
    return Navigator.of(this)
        .push<T>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: duration,
      ),
    )
        .whenComplete(() {
    });
  }

  // Метод для pushReplacement с анимацией
  Future<T?> pushReplaceWithSlide<T extends Object?, TO extends Object?>({
    required Widget page,
    TO? result,
    Duration duration = const Duration(milliseconds: 500),
    Curve curve = Curves.easeInOut,
  }) {
    return Navigator.of(this)
        .pushReplacement<T, TO>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: duration,
      ),
      result: result,
    )
        .whenComplete(() {
    });
  }

  // Добавьте в расширение:
  Future<void> pushAndRemoveUntilWithSlide({
    required Widget page,
    required bool Function(Route<dynamic>) predicate,
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return Navigator.of(this)
        .pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: duration,
      ),
      predicate,
    )
        .whenComplete(() {
    });
  }
}
