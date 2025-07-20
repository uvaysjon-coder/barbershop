import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:barbershop/features/main/detail_barber/presentations/widgets/actions_bar.dart';
import 'package:barbershop/features/main/detail_barber/presentations/widgets/detail_service.dart';
import 'package:barbershop/features/main/detail_barber/presentations/widgets/detail_services.dart';
import 'package:barbershop/features/main/detail_barber/presentations/widgets/detail_top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../booking_appointment/presentation/booking_appointment.dart';
import 'bloc/detail_barber_bloc.dart';

class DetailBarberPage extends StatefulWidget {
  const DetailBarberPage({super.key});

  @override
  State<DetailBarberPage> createState() => _DetailBarberPageState();
}

class _DetailBarberPageState extends State<DetailBarberPage> {
  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DetailBarberBloc, DetailBarberState>(
        builder: (context, state) {

          return Scaffold(
            floatingActionButton:  Padding(
              padding: AppSpacing.h12,
              child: CustomButton.primary(
                text: "Booking Now",
                onPressed: () {

                  context.pushWithSlide(
                    page: const BookingAppointment(),
                  );

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const BookingAppointment(),
                  //   ),
                  // );
                },
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            appBar: AppBar(
              title: Text(
                "Detail Barber",
                style: context.text.titleMedium,
              ),
            ),
            body: state.isLoading ? const Center(
              child: CircularProgressIndicator(),
            )
            : SingleChildScrollView(
              child: Column(
                children: [
                  const DetailTop(),
                  12.gap,
                  const ActionsBar(),
                  12.gap,
                  const DetailService(),
                  12.gap,
                  const DetailServices(),
                  70.gap,

                ],
              ),
            ),
          );
        },
      );

  @override
  void dispose() {
   // context.read<DetailBarberBloc>().add(const ClearPage());
    super.dispose();
  }
}
