import 'package:barbershop/core/themes/app_theme.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:barbershop/core/widgets/custom_chip.dart';
import 'package:barbershop/features/main/detail_barber/presentations/bloc/detail_barber_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/gen/assets.gen.dart';

class DetailService extends StatefulWidget {
  const DetailService({super.key});

  @override
  State<DetailService> createState() => _DetailServiceState();
}

class _DetailServiceState extends State<DetailService> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredBox(
          color: context.color.primaryBrand50,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  listService.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomChip(
                        backgroundColor: context.color.primaryBrand50,
                        label: listService[index].$2,
                        isSelected: index == selectedIndex,
                        onSelected: (v) {
                          context.read<DetailBarberBloc>().add(ChangeDetailService(listService[index].$3));
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        icon: SvgPicture.asset(
                          listService[index].$1,
                          colorFilter: ColorFilter.mode(
                            index == selectedIndex
                                ? context.color.primary
                                : context.color.primaryBrand500,
                            BlendMode.srcIn,
                          )
                        )
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

final listService = [
  (Assets.icon.peopleNearby.path, "About",DetailServiceEvent.about),
  (Assets.icon.scissors.path, "Services",DetailServiceEvent.services),
  (Assets.icon.calendarMark.path, "Schedule",DetailServiceEvent.schedule),
  (Assets.icon.start.path, "Reviews",DetailServiceEvent.reviews),
];
