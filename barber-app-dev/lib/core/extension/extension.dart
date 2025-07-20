import 'package:barbershop/core/themes/index.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

extension WidgetX on Widget {
  Widget repaintPointer() {
    return RepaintBoundary(
      child: this,
    );
  }

  Widget safeArea() {
    return SafeArea(
      child: this,
    );
  }



  Widget singleChildScrollView( BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: context.viewBottom,
      ),
      child: this,
    );
  }

  Widget keyboardDismisser() {
    return KeyboardDismisser(
      child: this,
    );
  }


  Widget withPopScope(
    void Function(bool, dynamic)? onPopInvokedWithResult, {
    bool? canPop,
  }) =>
      onPopInvokedWithResult == null && canPop == null
          ? this
          : PopScope(
              onPopInvokedWithResult: onPopInvokedWithResult,
              canPop: canPop ?? true,
              child: this,
            );

/*
  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget paddingSymmetric({required double vertical, required double horizontal}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget paddingOnly({required double left, required double right, required double top, required double bottom}) {
    return Padding(
      padding: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Widget marginAll(double value) {
    return Container(
      margin: EdgeInsets.all(value),
      child: this,
    );
  }

  Widget marginSymmetric({required double vertical, required double horizontal}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  Widget marginOnly({required double left, required double right, required double top, required double bottom}) {
    return Container(
      margin: EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: this,
    );
  }

  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget expanded() {
    return Expanded(
      child: this,
    );
  }

  Widget sizedBox({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget scrollable() {
    return SingleChildScrollView(
      child: this,
    );
  }

  Widget scrollableHorizontal() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: this,
    );
  }

  Widget scrollableVertical() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: this,
    );
  }

  Widget scrollableWithPadding() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: this,
    );
  }

  Widget scrollableHorizontalWithPadding() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      scrollDirection: Axis.horizontal,
      child: this,
    );
  }*/

  Widget scrollableVerticalWithPadding() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      scrollDirection: Axis.vertical,
      child: this,
    );
  }
}
