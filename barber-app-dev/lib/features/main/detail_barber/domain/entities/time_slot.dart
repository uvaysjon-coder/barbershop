import 'package:equatable/equatable.dart';

class TimeSlot extends Equatable {
  final String time; // Format: "HH:MM"
  final bool isBooked;
 final bool onSelected;

  const TimeSlot({
    required this.time,
    this.isBooked = false,
    this.onSelected = false,
  });

  @override
  List<Object?> get props => [time, isBooked];

  TimeSlot copyWith({
    String? time,
    bool? isBooked,
  }) {
    return TimeSlot(
      time: time ?? this.time,
      isBooked: isBooked ?? this.isBooked,
    );
  }
}