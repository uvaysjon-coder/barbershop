
/*
{
"scheduleStartTime": "2025-04-28T09:00:00Z",
"scheduleEndTime": "2025-04-28T10:00:00Z"
},
{
"scheduleStartTime": "2025-04-28T11:00:00Z",
"scheduleEndTime": "2025-04-28T11:30:00Z"
}*/


import 'package:equatable/equatable.dart';

class ScheduleEntities  extends Equatable {
  final String scheduleStartTime;
  final String scheduleEndTime;

  const ScheduleEntities({
    required this.scheduleStartTime,
    required this.scheduleEndTime,
  });

  @override
  List<Object?> get props => [scheduleStartTime, scheduleEndTime];
}