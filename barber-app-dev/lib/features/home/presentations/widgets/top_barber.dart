
import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:barbershop/features/home/presentations/widgets/user_item.dart';
import 'package:flutter/material.dart';

class TopBarber extends StatelessWidget {
  const TopBarber({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 5,
                height: 15,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              10.gap,
              Expanded(
                child: Text(
                  "Top Barbers",
                  style: context.text.titleLarge,
                ),
              ),
              // Navigation buttons

            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), // GridView ichida scroll bo‘lmasligi uchun
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Qator ichida nechta element bo‘lishini belgilash
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 13/16, // Kartochkalar nisbatini belgilash
            ),
            itemCount: 10, // Item soni
            itemBuilder: (_, index) => const UserItem(),
          ),
        ],
      ),
    );
  }
}
