import 'package:barbershop/features/main/detail_barber/domain/entities/schedule_entities.dart';

class ScheduleModel extends ScheduleEntities {
  const ScheduleModel({
    required super.scheduleStartTime,
    required super.scheduleEndTime,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) {
    return ScheduleModel(
      scheduleStartTime: json['scheduleStartTime'],
      scheduleEndTime: json['scheduleEndTime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'scheduleStartTime': scheduleStartTime,
      'scheduleEndTime': scheduleEndTime,
    };
  }
}
