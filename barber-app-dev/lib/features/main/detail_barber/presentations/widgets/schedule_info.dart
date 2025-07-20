import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/core/themes/app_borders.dart';
import 'package:barbershop/core/themes/app_theme.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/themes/app_spacing.dart';
import '../../../../../core/utils/utils.dart';
import '../bloc/detail_barber_bloc.dart';

class ScheduleInfo extends StatefulWidget {
  const ScheduleInfo({super.key});

  @override
  State<ScheduleInfo> createState() => _ScheduleInfoState();
}

class _ScheduleInfoState extends State<ScheduleInfo> {
  DateTime _date = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBarberBloc, DetailBarberState>(
      builder: (context, state) {
        // Update date from state if available
        if (state.selectedDate != null) {
          _date = state.selectedDate!;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => _showDatePicker(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.icon.calendarMark.svg(
                    colorFilter: ColorFilter.mode(
                      context.color.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  4.gap,
                  Text(
                    "${state.selectedDate?.day} ${getMonth(
                        state.selectedDate?.month ?? 0)} ${state.selectedDate
                        ?.year}",
                    style: context.text.titleMedium?.copyWith(
                      color: context.color.black,
                    ),
                  ),
                  4.gap,
                  Icon(
                    Icons.arrow_drop_down,
                    color: context.color.black,
                  ),
                ],
              ),
            ),
            8.gap,
            Text("Timeline", style: context.text.bodyMedium),
            8.gap,
            Expanded(
              child: ListView.builder(
                itemCount: state.timeSlots.length,
                itemBuilder: (context, index) {
                  final timeSlot = state.timeSlots[index];
                  return ScheduleItem(
                    time: timeSlot.time,
                    isUser: timeSlot.isBooked,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _showDatePicker(BuildContext context) {
    // Get today's date with time set to midnight
    final today = DateTime(DateTime
        .now()
        .year, DateTime
        .now()
        .month, DateTime
        .now()
        .day);

    showCupertinoModalPopup(
      context: context,
      builder: (_) =>
          BlocProvider.value(
            value: context.read<DetailBarberBloc>(),
            child: BlocBuilder<DetailBarberBloc, DetailBarberState>(
              builder: (context, state) {
                return Container(
                  height: context.height * 0.3,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: context.height * 0.2,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.date,
                          use24hFormat: true,
                          initialDateTime: state.selectedDate,
                          minimumDate: today,
                          // Use today at midnight
                          maximumDate: today.add(const Duration(days: 30)),
                          // Add one month limit
                          onDateTimeChanged: (DateTime picked) {
                            context.read<DetailBarberBloc>().add(
                              SelectDateTime(picked),
                            );
                          },
                        ),
                      ),
                      CupertinoButton(
                        child: const Text('Done'),
                        onPressed: () {
                          context.read<DetailBarberBloc>().add(
                              ChangeScheduleDate(state.selectedDate!));

                          // pPrint("Selected date: $_date");
                          // Fetch schedule for the selected date
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                );
              },
            ),
          ),
    ).then((value) {

      // Update the state with the selected date
      setState(() {

      });
    });
  }
}

class ScheduleItem extends StatelessWidget {
  final String time;
  final bool isUser;

  const ScheduleItem({
    this.isUser = false,
    super.key,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.v4,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            time,
            style: context.text.bodySmall?.copyWith(
              color: context.color.black,
            ),
          ),
          8.gap,
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 1,
                  color: context.color.coolGray200,
                ),
                isUser ?
                Container(
                  padding: AppSpacing.a12_8,
                  decoration: BoxDecoration(
                    borderRadius: AppBorders.r8,
                    color: context.color.yellow500,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // const Column(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     Stack(
                      //       alignment: Alignment.bottomRight,
                      //       children: [
                      //         // CircleAvatar(
                      //         //   radius: 20,
                      //         //   backgroundColor: context.color.white,
                      //         //   backgroundImage: const CachedNetworkImageProvider(
                      //         //     "https://img.freepik.com/free-photo/androgynous-avatar-non-binary-queer-person_23-2151100205.jpg",
                      //         //   ),
                      //         // ),
                      //         // Container(
                      //         //   decoration: BoxDecoration(
                      //         //     shape: BoxShape.circle,
                      //         //     border: Border.all(
                      //         //       color: context.color.white,
                      //         //       width: 1,
                      //         //     ),
                      //         //   ),
                      //         //   child: CircleAvatar(
                      //         //     radius: 8,
                      //         //     backgroundImage: CachedNetworkImageProvider(
                      //         //       "https://img.freepik.com/free-photo/androgynous-avatar-non-binary-queer-person_23-2151100205.jpg",
                      //         //     ),
                      //         //   ),
                      //         // )
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // 8.gap,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Booked",
                            style: context.text.titleMedium?.copyWith(
                              color: context.color.white,
                            ),
                          ),
                          // 4.gap,
                          // Text(
                          //   "Basic Haircut",
                          //   style: context.text.bodyMedium?.copyWith(
                          //     color: context.color.white,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                ) : Container(
                  padding: AppSpacing.v4,
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}