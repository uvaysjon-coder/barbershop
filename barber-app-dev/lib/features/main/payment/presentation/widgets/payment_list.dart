import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/features/main/booking_appointment/presentation/widgets/payment_service.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/utils.dart';
import '../../../booking_appointment/presentation/widgets/select_service_item_big.dart';
import '../../../detail_barber/presentations/bloc/detail_barber_bloc.dart';
import 'select_payment_service.dart';

class PaymentList extends StatelessWidget {
  const PaymentList({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.color.white,
        borderRadius: AppBorders.tl24,
      ),
      child: BlocBuilder<DetailBarberBloc, DetailBarberState>(
        builder: (context, state) => Padding(
          padding: AppSpacing.a20,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text("Date & Time",
                  style: context.text.titleMedium?.copyWith(
                    color: context.color.black,
                  ),
                ),
                8.gap,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.icon.calendarMark.svg(
                      colorFilter: ColorFilter.mode(
                        context.color.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    8.gap,
                    Text("${state.selectedDate?.day} ${getMonth(
                        state.selectedDate?.month ?? 0)} ${state.selectedDate
                        ?.year} - ${state.timeSlots[state.selectedTimeSlotIndex!].time}",
                      style: context.text.subHeadline3?.copyWith(
                        color: context.color.coolGray500,
                      ),
                    ),
                  ],
                ),
                12.gap,

                const DottedLine(),

                Row(
                  children: [
                    Assets.icon.scissors.svg(
                      colorFilter: ColorFilter.mode(
                        context.color.black,
                        BlendMode.srcIn,
                      ),
                    ),
                    8.gap,
                    Text("Select services",
                      style: context.text.titleMedium?.copyWith(
                        color: context.color.black,
                      ),
                    ),
                  ],
                ),
               /* const DottedLine(
                  dashLength: 4,
                  lineThickness: 2,
                  dashColor: AppColors.coolGray200,
                  direction: Axis.horizontal,
                ),*/
                8.gap,
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    ...List.generate(state.selectedTimeSlots.length, (index){

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: SelectServiceItemBig(
                          style: state.selectedTimeSlots[index],
                          onTap: (value){

                          },
                           readOnly: true,
                        ),
                      );
                    })

                  ],
                ),
                12.gap,

                const DottedLine(),
                const PaymentService(),
                const SelectPaymentService(),
                50.gap,
              ],
            ),
        ),
      ),
    );
  }
}
