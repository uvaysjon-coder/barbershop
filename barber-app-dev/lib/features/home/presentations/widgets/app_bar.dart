

import 'package:barbershop/core/themes/index.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: kToolbarHeight,
      child: Row(
        children: [

          Expanded(
            child: Container(
              padding: AppSpacing.a12,
              decoration: BoxDecoration(
                // color: context.color.lightGreyBackground,
                borderRadius: AppBorders.r12,
            
              ),
              child: Row(
                children: [
                  // Icon(Icons.more_vert, color: context.color.pureBlack, size: 20),
                  10.gap,
                  Expanded(child: Text("Search", style: context.textTheme.bodySmall)),
                  // Icon(Icons.search, color: context.color.pureBlack, size: 20),
            
                ],
              ),
            ),
          ),
          10.gap,
          Container(
            padding: AppSpacing.a12,
            decoration: BoxDecoration(
              // color: context.color.lightGreyBackground,
              borderRadius: AppBorders.r12,
            ),
            // child: Icon(Icons.notifications, color: context.color.pureBlack, size: 20),
          ),

        ],
      ),
    );
  }
}
