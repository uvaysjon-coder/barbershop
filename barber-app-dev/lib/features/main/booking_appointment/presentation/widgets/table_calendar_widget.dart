import 'package:barbershop/features/main/detail_barber/presentations/bloc/detail_barber_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../core/themes/index.dart';

class TableCalendarWidget extends StatefulWidget {
  const TableCalendarWidget({super.key});

  @override
  State<TableCalendarWidget> createState() => _TableCalendarWidgetState();
}

class _TableCalendarWidgetState extends State<TableCalendarWidget> {
  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    final selectedDate = context
        .select<DetailBarberBloc, DateTime>((bloc) => bloc.state.selectedDate??
            DateTime.now());

    return TableCalendar(
      onDaySelected: (DateTime selectDay, DateTime focusDay) {
        context.read<DetailBarberBloc>().add(ChangeScheduleDate(selectDay));

        setState(() {});
      },
      firstDay: currentDate,
      availableGestures: AvailableGestures.horizontalSwipe,
      lastDay: currentDate.add(const Duration(days: 30)),
      daysOfWeekVisible: true,
      daysOfWeekHeight: 40,
      onFormatChanged: (format) {},
      calendarFormat: CalendarFormat.month,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: true,
        defaultTextStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        weekendTextStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        selectedTextStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        selectedDecoration: BoxDecoration(
          color: context.color.primary,
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: context.color.primary,
          shape: BoxShape.circle,
        ),
      ),
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekendStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        weekdayStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        headerPadding: AppSpacing.h12,
        headerMargin: AppSpacing.h12,
        decoration: BoxDecoration(
          color: context.color.primaryBrand50,
          borderRadius: AppBorders.r12,
        ),
      ),
      weekNumbersVisible: false,
      
      currentDay: selectedDate,
      focusedDay: selectedDate,
    );
  }
}
