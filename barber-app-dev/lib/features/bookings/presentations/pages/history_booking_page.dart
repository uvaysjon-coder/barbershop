import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/index.dart';
import '../bloc/booking_bloc.dart';
import '../booking_detail_page.dart';
import '../widgets/history_booking.dart';

class HistoryBookingPage extends StatelessWidget {
  const HistoryBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if(state.completedBookings.isEmpty) {
          return Assets.lottie.empty.lottie(
            fit: BoxFit.scaleDown,
          );

        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.completedBookings.length,
                itemBuilder: (context, index) {
                  final booking = state.completedBookings[index];
                  return HistoryBooking(booking: booking,
                      onTap: (c) {
                        context.pushWithSlide(
                            page: BookingDetailPage(booking: booking));

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
