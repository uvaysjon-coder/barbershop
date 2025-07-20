import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/widgets/custum_toast.dart';
import 'package:barbershop/core/widgets/small_barber_item.dart';
import 'package:barbershop/features/dashboard/presentations/dashboard_page.dart';
import 'package:barbershop/features/main/payment/presentation/widgets/payment_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/barber_entities.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../bookings/presentations/bloc/booking_bloc.dart';
import '../../detail_barber/presentations/bloc/detail_barber_bloc.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBarberBloc, DetailBarberState>(
      listener: (context , state){

        switch(state.status){
          case null:
            break;
            // TODO: Handle this case.
          case DetailBarberStatus.success:

            context.toast.success(state.successMessage ?? "");

           /* ScaffoldMessenger.of(context)
                .showSnackBar( SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: context.color.tealGreen400,
              behavior: SnackBarBehavior.floating,
              content: Text(state.successMessage ?? ""),
            ));*/


            context.read<BookingBloc>().add(GetAllBookingEvent());

            context.pushAndRemoveUntilWithSlide(
              predicate: (p0) => false,
              page: const DashboardPage(),

            );

            // TODO: Handle this case.
          case DetailBarberStatus.failure:
            if(state.errorMessage == null) {
              return;
            }

            context.toast.error("${state.errorMessage}",
              actions: [
                ToastAction(label: "Retry", onPressed: () {
                  context.read<DetailBarberBloc>().add(const BookingPaymentEvent() );
                },)
              ],

            );

           /* ScaffoldMessenger.of(context)
                .hideCurrentSnackBar();

            ScaffoldMessenger.of(context)
                .showSnackBar( SnackBar(
              backgroundColor: context.color.red,
              behavior: SnackBarBehavior.floating,
              content: Text(state.errorMessage ?? ""),
              action:  SnackBarAction(
                label: "retry",
                textColor: context.color.white,
                onPressed: () {
                  context.read<DetailBarberBloc>().add(const BookingPaymentEvent() );
                },
              ),
            ));*/



            // TODO: Handle this case.
        }

      },

      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.color.primary,
          appBar: AppBar(
            iconTheme: IconThemeData(color: context.color.white),
            backgroundColor: context.color.primary,
            title: Text(
              "Your Appointment",
              style: context.text.titleMedium?.copyWith(
                  color: context.color.white),
            ),
          ),
          body: Stack(
            children: [
              Assets.img.loginBg.image(
                width: context.width,
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    24.gap,
                    BarberItems(
                        barberEntities: state.detailBarber!.toBarberEntities()),
                    24.gap,

                    const PaymentList()
                  ],
                ),
              ),

            ],
          ),
          floatingActionButton: BlocBuilder<DetailBarberBloc, DetailBarberState>(
            builder: (context, state) {
              return Container(
                margin: AppSpacing.a12,
                child: CustomButton.primary(
                  enabled: state.selectedTimeSlots.isNotEmpty && state.selectPaymentService != null && !state.isLoading,
                  loading: state.isLoading,
                  text: "Pay",
                  onPressed: () {
                    context.read<DetailBarberBloc>().add(const BookingPaymentEvent() );
                  },
                ).safeArea(),
              );
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerFloat,
        );
      },
    );
  }
}

class BarberItems extends StatelessWidget {
  final BarberEntities barberEntities;

  const BarberItems({super.key, required this.barberEntities});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.h12,
      decoration: BoxDecoration(
        color: context.color.primaryBrand600.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SmallBarberItem(
        barberEntities: barberEntities,
        isNight: true,
      ),
    );
  }
}
