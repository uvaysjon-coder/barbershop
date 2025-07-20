import 'package:flutter/material.dart';

import '../themes/index.dart';
import 'custom_bouncing.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool loading;
  final bool enabled;
  final VoidCallback? onPressed;
  final double radius;
  final double? height;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? leading;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final CustomButtonType type;
  final Widget? prefixIcon;

  const CustomButton._(
      this.loading,
      this.enabled,
      this.text,
      this.onPressed, {
        Key? key, // Changed from super.key to Key? key
        this.radius = 8,
        this.backgroundColor,
        this.textColor,
        this.leading,
        this.padding,
        this.margin,
        this.type = CustomButtonType.primary,
        this.prefixIcon,
        this.height,
      }) : super(key: key); // Pass key to super constructor

  const CustomButton.primary({
    Key? key, // Changed from super.key to Key? key
    required String text,
    required VoidCallback? onPressed,
    bool loading = false,
    bool enabled = true,
    double radius = 8,
    Color? backgroundColor,
    Color? textColor,
    double? height,
    Widget? leading,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Widget? prefixIcon,
  }) : this._(
    loading,
    enabled,
    text,
    onPressed,
    key: key, // Pass key explicitly
    radius: radius,
    backgroundColor: backgroundColor,
    textColor: textColor,
    leading: leading,
    height: height,
    padding: padding,
    margin: margin,
    prefixIcon: prefixIcon,
    type: CustomButtonType.primary,
  );

  const CustomButton.secondary({
    Key? key, // Changed from super.key to Key? key
    required String text,
    required VoidCallback? onPressed,
    bool loading = false,
    bool enabled = true,
    double radius = 8,
    Color? backgroundColor,
    Color? textColor,
    double? height,
    Widget? leading,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Widget? prefixIcon,
  }) : this._(
    loading,
    enabled,
    text,
    onPressed,
    key: key, // Pass key explicitly
    radius: radius,
    backgroundColor: backgroundColor,
    textColor: textColor,
    leading: leading,
    padding: padding,
    margin: margin,
    prefixIcon: prefixIcon,
    type: CustomButtonType.secondary,
  );

  const CustomButton.naked({
    Key? key, // Changed from super.key to Key? key
    required String text,
    required VoidCallback? onPressed,
    bool loading = false,
    bool enabled = true,
    double radius = 8,
    Color? backgroundColor,
    Color? textColor,
    Widget? leading,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Widget? prefixIcon,
  }) : this._(
    loading,
    enabled,
    text,
    onPressed,
    key: key, // Pass key explicitly
    radius: radius,
    backgroundColor: backgroundColor,
    textColor: textColor,
    leading: leading,
    padding: padding,
    margin: margin,
    prefixIcon: prefixIcon,
    type: CustomButtonType.naked,
  );

  const CustomButton.icon({
    Key? key, // Changed from super.key to Key? key
    required Widget icon,
    required VoidCallback? onPressed,
    bool loading = false,
    bool enabled = true,
    double radius = 8,
    Color? backgroundColor,
    Color? textColor,
    Widget? leading,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) : this._(
    loading,
    enabled,
    '',
    onPressed,
    key: key, // Pass key explicitly
    radius: radius,
    backgroundColor: backgroundColor,
    textColor: textColor,
    leading: leading,
    padding: padding,
    margin: margin,
    prefixIcon: icon,
    type: CustomButtonType.icon,
  );

  VoidCallback? _onPressed() {
    if (!enabled) return null;
    return () {
      if (loading) return;
      onPressed?.call();
    };
  }

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      CustomButtonType.primary => _primaryButton(context),
      CustomButtonType.secondary => _secondaryButton(context),
      CustomButtonType.naked => _nakedButton(context),
      CustomButtonType.icon => _iconButton(context),
    };
  }

  Widget _nakedButton(BuildContext context) {
    return Bouncing(
      onTap: _onPressed(),
      child: Container(
        margin: margin,
        padding: padding ?? AppSpacing.a10_16,
        child: _child(enabled ? (textColor ?? context.color.primary) : context.color.unSelected, context),
      ),
    );
  }

  Widget _secondaryButton(BuildContext context) {
    return Bouncing(
      onTap: _onPressed(),
      child: Container(
        width: context.width,
        height: height ?? 50,
        margin: margin,
        padding: padding ?? AppSpacing.a10_16,
        decoration: BoxDecoration(
          color: context.color.white,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: enabled ? (backgroundColor ?? context.color.primary) : context.color.unSelected,
            width: 2,
          ),
        ),
        child: _child(enabled ? (textColor ?? context.color.primary) : context.color.unSelected, context),
      ),
    );
  }

  Widget _primaryButton(BuildContext context) {
    return Bouncing(
      onTap: _onPressed(),
      child: Container(
        width: context.width,
        height: height ?? 50,
        margin: margin,
        padding: padding ?? AppSpacing.a10_16,
        decoration: BoxDecoration(
          color: enabled ? (backgroundColor ?? context.color.primary) : context.color.unSelected,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: _child(enabled ? (textColor ?? context.color.white) : context.color.white, context),
      ),
    );
  }

  Widget _child(Color? color, BuildContext context) {
    return loading
        ? Center(
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(
          strokeWidth: 3,
          backgroundColor: color,
        ),
      ),
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        prefixIcon ?? const SizedBox(),
        const SizedBox(width: 8), // Replaced 8.gap with SizedBox
        Text(
          text,
          style: context.textTheme.titleSmall?.copyWith(
            color: color ?? context.color.white,
          ),
        ),
        const SizedBox(width: 8), // Replaced 8.gap with SizedBox
        leading ?? const SizedBox(),
      ],
    );
  }

  Widget _iconButton(BuildContext context) {
    return Bouncing(
      onTap: _onPressed(),
      child: Container(
        margin: margin,
        padding: padding ?? AppSpacing.a10_16,
        decoration: BoxDecoration(
          color: enabled ? (backgroundColor ?? context.color.primary) : context.color.unSelected,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: prefixIcon,
      ),
    );
  }
}

enum CustomButtonType { primary, secondary, naked, icon }