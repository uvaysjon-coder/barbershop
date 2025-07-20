
import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/core/widgets/custum_toast.dart';
import 'package:barbershop/features/bookings/presentations/bloc/booking_bloc.dart';
import 'package:barbershop/features/dashboard/presentations/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentations/bloc/home_bloc.dart';
import '../../../../profile/presentations/bloc/profile_bloc.dart';
import '../bloc/otp_bloc.dart';

class OtpListener extends StatelessWidget {
  final Widget child;
  const OtpListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OtpBloc, OtpState>(
      listener: (context, state) {
        switch (state.eventOtp) {
          case EventOtp.success:

            context.read<HomeBloc>().getRestart();
            context.read<OtpBloc>().add(const OtpChangeEvent(""));
            context.read<HomeBloc>().add(HomePageEntered());
            context.read<BookingBloc>().add(GetAllBookingEvent());
            context.read<ProfileBloc>().add(const ProfileInitialEvent());

            context.pushAndRemoveUntilWithSlide(
              predicate: (p0) => false,
              page: const DashboardPage(),
            );
            context.toast.success("Login Success");

            break;
          default:
        }
      },
      child: child,
    );
  }
}
