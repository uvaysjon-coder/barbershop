part of 'booking_bloc.dart';

sealed class BookingEvent extends Equatable{}

class BookingChangeTabIndex extends BookingEvent {
  final int index;

   BookingChangeTabIndex(this.index);

  @override
  List<Object?> get props => [index];
}

final class GetAllBookingEvent extends BookingEvent {

   GetAllBookingEvent();

  @override
  List<Object?> get props => [];
}