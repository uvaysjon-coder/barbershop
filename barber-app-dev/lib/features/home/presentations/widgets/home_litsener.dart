import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/features/home/presentations/bloc/home_bloc.dart';
import 'package:barbershop/features/main/detail_barber/presentations/bloc/detail_barber_bloc.dart';
import 'package:barbershop/features/main/detail_barber/presentations/detail_barber_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main/explore_barber/presentations/explore_barber_page.dart';
import 'bottom_filter.dart';

class HomeListener extends StatelessWidget {
  final Widget child;

  const HomeListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (BuildContext context, state) {
        if (state.barberId != null && state.barberId!.isNotEmpty) {
          context
              .read<DetailBarberBloc>()
              .add(GetDetailBarber(state.barberId!));

          context.pushWithSlide(page: const DetailBarberPage())
              .whenComplete(() {
            context.mounted ? context.read<HomeBloc>().add(BuildState()) : null;
          });
        }

        pPrint(state.eventHome);
        switch (state.eventHome) {
          case EventHome.filterSummitButton:
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent, // Muhim - shaffof qilish
              context: context,
              builder: (_) => const BottomFilter(),
            ).whenComplete(() {
              context.mounted
                  ? context.read<HomeBloc>().add(BuildState())
                  : null;
            });
            break;

            // TODO: Handle this case.
            break;
          case EventHome.exploreBarberPage:
            /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExploreBarberPage()))*/
                context.pushWithSlide(page: const ExploreBarberPage()).whenComplete(() {
              context.mounted
                  ? context.read<HomeBloc>().add(BuildState())
                  : null;
            });
            break;

          default:
        }
      },
      child: child,
    );
  }
}
