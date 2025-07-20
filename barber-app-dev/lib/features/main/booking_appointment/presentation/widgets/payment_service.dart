import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../detail_barber/presentations/bloc/detail_barber_bloc.dart';

class PaymentService extends StatelessWidget {
  const PaymentService({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBarberBloc, DetailBarberState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Payment summary",
              style: context.text.titleMedium,
            ),
            12.gap,
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.selectedTimeSlots.length,
              separatorBuilder: (context, index) => 12.gap,
              itemBuilder: (context, index) {
                pPrint(state.selectedTimeSlots.length);
                final haircutStyle = state.selectedTimeSlots[index];
               // pPrint("haircutStyle: ${haircutStyle.id}");
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      haircutStyle.name.split("_").join(" "),
                      style: context.text.titleSmall,
                    ),
                    Text(
                      haircutStyle.price,
                      style: context.text.bodyLarge,
                    ),
                  ],
                );
              },
            ),
            12.gap,
            const DottedLine(),

            12.gap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Full price",
                  style: context.text.titleSmall,
                ),
                Text(
                  state.selectedTimeSlots.fold<double>(0, (previousValue, element) {
                      return previousValue + (double.tryParse(element.price) ?? 0);
                    }).toStringAsFixed(2),
                  style: context.text.bodyLarge,
                ),
              ],
            ),
            20.gap,
          ],
        );
      },
    );
  }
}
