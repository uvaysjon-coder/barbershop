
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/index.dart';

class ActionIconButton extends StatelessWidget {
  final String icon;
  final String label;
  final Function()? onTap;

  const ActionIconButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      borderRadius: AppBorders.r8,
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(icon),
          2.gap,
          Text(label, style: context.text.bodyMedium?.copyWith(
              color: context.color.primary)),
        ],
      ),
    );
  }
}