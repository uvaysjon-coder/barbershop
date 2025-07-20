import 'package:barbershop/core/themes/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/all_shimmer.dart';
import '../../../../../core/widgets/small_barber_item.dart';
import '../../../../home/presentations/bloc/home_bloc.dart';

class BarbersList extends StatelessWidget {
  const BarbersList({super.key,  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const NearestBarberShopShimmer();
        }

        if(state.barberEntities?.isEmpty != null && state.barberEntities!.isEmpty && state.isLoading == false) {
          return Center(
            child: Text(
             "No founds barbers ",
              style: context.text.titleMedium?.copyWith(
                color: context.color.red500,
              ),
            ),
          );
        }

        return Padding(

          padding: AppSpacing.h12,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.barberEntities?.length ?? 0,
                itemBuilder: (context, index) {
                  return SmallBarberItem(
                    barberEntities: state.barberEntities![index],
                    onTap: (id) {
                      context.read<HomeBloc>().add(GetBarber(id));

                      // context.read<HomeBloc>().add(
                      //   BarberDetailPage(id),
                      // );
                    },
                  );
                },
              ),
              8.gap,
              if(state.pageLoading)
                const LinearProgressIndicator(),
              12.gap,
            ],
          ),
        );
      },
    );
  }
}
