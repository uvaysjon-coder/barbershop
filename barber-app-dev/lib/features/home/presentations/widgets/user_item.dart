import 'package:barbershop/core/themes/index.dart';
import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  const UserItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.a12,
      decoration: BoxDecoration(
        //color: context.color.pureWhite,
        borderRadius: AppBorders.r12,
        boxShadow: const [
          BoxShadow(
        //    color: context.color.pureBlack.withOpacity(0.1),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: AppBorders.r12,
            child: Image.network(
              'https://images.fresha.com/lead-images/placeholders/barbershop-61.jpg',
              width: 125,
              height: 125,
              fit: BoxFit.cover,
            ),
          ),
          12.gap,
          // Text(
          //   "John Doe",
          //   style: context.text.titleMedium?.copyWith(color: context.color.grey),
          // ),
          4.gap,
          InkWell(
            borderRadius: AppBorders.r12,
            child: Container(
              padding: AppSpacing.a8,
              decoration: BoxDecoration(
              //  color: context.color.grey.withOpacity(0.1),
                borderRadius: AppBorders.r12,
              ),
              child: const Text(
                "Click to see more",
               // style: context.text.bodyMedium?.copyWith(color: context.color.pureBlack),
              ),
            ),
          )

        ],
      ),
    );
  }
}
