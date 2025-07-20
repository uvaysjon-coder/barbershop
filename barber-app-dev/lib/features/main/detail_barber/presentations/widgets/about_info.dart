import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/widgets/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/detail_barber_bloc.dart';

class AboutInfo extends StatelessWidget {
  const AboutInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBarberBloc, DetailBarberState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpandableFormattedText(
              text: state.detailBarber?.description ?? "No description",
            ),
            12.gap,
            Text("Opening Hours", style: context.text.titleMedium),
            8.gap,
            ListView.builder(
              shrinkWrap: true,
              itemCount:
                  state.detailBarber?.workingWeekDate.split("-").length ?? 0,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                          state.detailBarber?.workingWeekDate.split('-')[index] ??
                              "",
                          style: context.text.bodyMedium),
                    ),
                    8.gap,
                    Text(
                        "${state.detailBarber?.startDate.substring(0, (state.detailBarber?.startDate.length ?? 0) - 3)} - ${state.detailBarber?.endDate.substring(0, (state.detailBarber?.endDate.length ?? 0) - 3)}",
                        style: context.text.titleSmall),
                  ],
                );
              },
            ),
            /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("All Day", style: context.text.bodyMedium),
                8.gap,
                Text("${state.detailBarber?.startDate} - ${state.detailBarber?.endDate}", style: context.text.titleSmall),
              ],
            ),*/
            8.gap,

            /* Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Saturday", style: context.text.bodyMedium),
                8.gap,
                Text("09:00 - 18:00", style: context.text.titleSmall),
              ],
            ),
            12.gap,*/
            // Text("Our Tim", style: context.text.titleMedium),
            // 8.gap,
            // ListView.builder(
            //   shrinkWrap: true,
            //   itemCount: 5,
            //   itemBuilder: (context, index) {
            //     return const UsersOpinion();
            //   },
            // ),
          ],
        );
      },
    );
  }
}

class UsersOpinion extends StatelessWidget {
  const UsersOpinion({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          child: Assets.icon.user.svg(),
        ),
        8.gap,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("John Doe", style: context.text.titleMedium),
              4.gap,
              Text("5.0", style: context.text.titleMedium),
            ],
          ),
        ),
        Assets.icon.start.svg(),
        4.gap,
        Text("5.0", style: context.text.bodyMedium),
        4.gap,
      ],
    );
  }
}
