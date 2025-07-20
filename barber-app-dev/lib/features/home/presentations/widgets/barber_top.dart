import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/core/widgets/all_shimmer.dart';
import 'package:barbershop/core/widgets/big_barber_item.dart';
import 'package:barbershop/core/widgets/custom_indicator.dart';
import 'package:barbershop/features/home/presentations/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/app_spacing.dart';

class BarberTop extends StatefulWidget {
  const BarberTop({super.key});

  @override
  State<BarberTop> createState() => _BarberTopState();
}

class _BarberTopState extends State<BarberTop> {


  final PageController _pageController = PageController(
    viewportFraction: 0.93,
    initialPage: 0,
  );

  @override
  void initState() {



    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {

        if (state.isLoading ) {
          return const BarberTopShimmer();
        }
        
        return ListView(

          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: AppSpacing.h12,
              child: Text("Most recommended", style: context.text.titleLarge),
            ),
            8.gap,
            SizedBox(
              height: context.height * 0.45,
              child: PageView.builder(
                controller: _pageController,
                itemCount: state.topEntities?.length ?? 0,
                onPageChanged: (index) {
                  context.read<HomeBloc>().add(ChangePageIndex(index));
                },
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return BigBarberItem(barberEntities: state.topEntities![index],
                      onTap: (id) {
                    pPrint("Barber id: $id");
                         context.read<HomeBloc>().add(GetBarber(id));
                      });
                },
              ),
            ),
            8.gap,
            Padding(
              padding: AppSpacing.h12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<HomeBloc, HomeState>(
                    buildWhen: (previous, current) =>
                    previous.currentIndex != current.currentIndex,
                    builder: (context, state) {
                      return AnimatedCustomIndicator(
                        count: state.topEntities?.length ??0,
                        currentIndex: state.currentIndex,
                      );
                    },
                  ),
                ],
              ),
            ),
            8.gap,
          ],
        );
      },
    );
  }
}
