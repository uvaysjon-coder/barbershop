import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/features/bookings/presentations/booking_detail_page.dart';
import 'package:barbershop/features/bookings/presentations/widgets/active_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/index.dart';
import '../bloc/booking_bloc.dart';

class ActiveBookingPage extends StatelessWidget {
  const ActiveBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {

        if(state.activeBookings.isEmpty) {
          return Assets.lottie.empty.lottie(
            fit: BoxFit.scaleDown,
          );

        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.activeBookings.length,
                itemBuilder: (context, index) {
                  final booking = state.activeBookings[index];
                  return ActiveBooking(booking: booking,
                    onTap: (c) {
                    context.pushWithSlide(
                      page:  BookingDetailPage(booking: booking),

                    );
                  }
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
