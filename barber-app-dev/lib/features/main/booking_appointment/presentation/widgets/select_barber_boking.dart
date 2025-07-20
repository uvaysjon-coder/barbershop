import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/themes/app_spacing.dart';
import '../../../../../core/widgets/custom_chip.dart';
import '../../../detail_barber/presentations/bloc/detail_barber_bloc.dart';

class SelectBarberBooking extends StatefulWidget {
  const SelectBarberBooking({super.key});

  @override
  State<SelectBarberBooking> createState() => _SelectBarberBookingState();
}

class _SelectBarberBookingState extends State<SelectBarberBooking> {



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBarberBloc, DetailBarberState>(
      builder: (context, state) {
        return Wrap(
          children: [
            ...List.generate(state.timeSlots.length, (index){
              return Padding(
                padding: AppSpacing.a4,
                child: CustomChip(
                  label: state.timeSlots[index].time,
                  isDisabled: state.timeSlots[index].isBooked,
                  isSelected: state.selectedTimeSlotIndex == index,

                  onSelected: (isSelected) {
                    if (isSelected) {
                      context.read<DetailBarberBloc>().add(
                        SelectTimeSlot(index),
                      );
                    }


                  },
                ),
              );
            })
          ],
        );
      },
    );
  }
}
