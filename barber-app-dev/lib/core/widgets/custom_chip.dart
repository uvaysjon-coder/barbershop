import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/core/themes/app_theme.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final Widget? icon;
  final bool isSelected;
  final bool isDisabled;
  final Color? backgroundColor;
  final Function(bool) onSelected;

  const CustomChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
    this.icon,
    this.isDisabled = false,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        !isDisabled ?  onSelected(!isSelected) : null;
      },

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color:
                isDisabled ? context.color.coolGray50 : (isSelected ? context.color.primaryBrand50 : (backgroundColor ?? context.color.white)),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDisabled ?  context.color.coolGray200  : ( isSelected ? context.color.blueGray600 : (backgroundColor ?? context.color.white)),
              width: 1,
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon!,
            if (icon != null) 4.gap,
            Text(label,
                style: context.text.bodyMedium?.copyWith(
                  color: isSelected
                      ? context.color.primary
                      : context.color.primaryBrand700,
                )),
          ],
        ),
      ),
    );
  }
}
