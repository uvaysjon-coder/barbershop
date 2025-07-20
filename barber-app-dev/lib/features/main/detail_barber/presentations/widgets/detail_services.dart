import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/features/main/detail_barber/presentations/widgets/about_info.dart';
import 'package:barbershop/features/main/detail_barber/presentations/widgets/reviews_info.dart';
import 'package:barbershop/features/main/detail_barber/presentations/widgets/schedule_info.dart';
import 'package:barbershop/features/main/detail_barber/presentations/widgets/service_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/detail_barber_bloc.dart';

class DetailServices extends StatelessWidget {
  const DetailServices({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBarberBloc, DetailBarberState>(
      builder: (context, state) {
        return Padding(
          padding: AppSpacing.h12,
          child: SizedBox(
            // Increase the height to allow more content to be visible
            height: context.height * 0.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                // Use Expanded to allow the content to fill available space
                Expanded(
                  child: switch(state.detailService){
                    DetailServiceEvent.about => const AboutInfo(),
                    DetailServiceEvent.services => const ServiceInfo(),
                    DetailServiceEvent.schedule => const ScheduleInfo(),
                    DetailServiceEvent.reviews => const ReviewsInfo(),
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}