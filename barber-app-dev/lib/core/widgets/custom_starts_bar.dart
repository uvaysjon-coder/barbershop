import 'package:barbershop/core/themes/app_spacing.dart';
import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';

class CustomStartsBar extends StatelessWidget {
  final bool big;
  final int starts;

  const CustomStartsBar({super.key, required this.starts, this.big = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 0; i < 5; i++)
          if (i < starts)
            Padding(
              padding:AppSpacing.r4_l0,
              child: Assets.icon.startCheck.svg(
                width: big ? 24 : 12,
                height: big ? 24 : 12,
              ),
            )
          else
            Padding(
              padding:AppSpacing.r4_l0,
              child: Assets.icon.startUncheck.svg(
                width: big ? 24 : 12,
                height: big ? 24 : 12,
              ),
            )
      ],
    );
  }
}
