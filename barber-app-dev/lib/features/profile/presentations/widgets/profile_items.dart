
import 'package:barbershop/core/themes/index.dart';
import 'package:flutter/material.dart';

class ProfileItems extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const ProfileItems(this.title,  {this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: AppSpacing.v4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.color.primary,
                )
              ),
            ),
            Assets.icon.arrowForward.svg(
              height: context.height * 0.03,
              width: context.width * 0.03,
            ),
            /*Icon(
              Icons.arrow_forward_ios,
              color: context.color.primary,
            )*/
          ],
        ),
      ),
    ).repaintPointer();
  }
}
