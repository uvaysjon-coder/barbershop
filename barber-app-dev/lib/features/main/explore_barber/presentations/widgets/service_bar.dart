import 'package:barbershop/core/themes/app_spacing.dart';
import 'package:barbershop/core/widgets/custom_chip.dart';
import 'package:flutter/material.dart';

import '../../../../home/presentations/widgets/bottom_filter.dart';

class ServiceBar extends StatefulWidget {
  const ServiceBar({super.key});

  @override
  State<ServiceBar> createState() => _ServiceBarState();
}

class _ServiceBarState extends State<ServiceBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:AppSpacing.h12,
        child: Row(
          children: List.generate(
            listFilter.length,
                (index) => CustomChip(
                  label: listFilter[index],
                  isSelected: index == selectedIndex,
                  onSelected: (v) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
          ),
        ),
      ),
    );
  }
}
