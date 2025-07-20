
import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/features/main/booking_appointment/presentation/widgets/select_barber_boking.dart';
import 'package:barbershop/features/main/booking_appointment/presentation/widgets/select_service.dart';
import 'package:barbershop/features/main/payment/presentation/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../detail_barber/presentations/bloc/detail_barber_bloc.dart';
import '/../core/themes/app_spacing.dart';
import '/../core/themes/extensions/context_extension.dart';
import '/../core/widgets/custom_button.dart';
import '../../../../core/gen/assets.gen.dart';
import 'widgets/payment_service.dart';
import 'widgets/table_calendar_widget.dart';

class BookingAppointment extends StatefulWidget {
  const BookingAppointment({super.key});

  @override
  State<BookingAppointment> createState() => _BookingAppointmentState();
}

class _BookingAppointmentState extends State<BookingAppointment> {
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Booking Appointment",
          style: context.text.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: AppSpacing.h12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Date",
                style: context.text.titleSmall?.copyWith(
                  color: context.color.primary,
                )),
            12.gap,
            const TableCalendarWidget(),
            12.gap,
            Text("Choose Service",
                style: context.text.titleSmall?.copyWith(
                  color: context.color.primary,
                )),
            8.gap,
            const SelectService(),
            12.gap,
            Text("Available time",
                style: context.text.titleSmall?.copyWith(
                  color: context.color.primary,
                )),
            8.gap,
            const SelectBarberBooking(),
            const PaymentService(),
            BlocBuilder<DetailBarberBloc, DetailBarberState>(
              builder: (context, state) {
                return CustomButton.primary(
                  enabled:
                      state.selectedTimeSlots.isNotEmpty && state.selectedTimeSlotIndex != null,

                  text: "Deal booking",
                  leading: Assets.icon.calendarMark.svg(),
                  onPressed: () {

                    context.pushWithSlide(
                      page:  const PaymentPage(),
                    );

                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const PaymentPage(),
                    //   ),
                    // );
                  },
                );
              },
            ),
            12.gap,
          ],
        ),
      ),
    );
  }
}
