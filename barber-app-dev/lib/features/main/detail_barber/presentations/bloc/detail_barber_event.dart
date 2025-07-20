part of 'detail_barber_bloc.dart';

sealed class DetailBarberEvent extends Equatable {
  const DetailBarberEvent();
}

final class ChangeDetailService extends DetailBarberEvent {
  final DetailServiceEvent detailService;

  const ChangeDetailService(this.detailService);

  @override
  List<Object> get props => [detailService];
}

final class GetDetailBarber extends DetailBarberEvent {
  final String id;

  const GetDetailBarber(this.id);

  @override
  List<Object> get props => [id];
}

final class ChangeScheduleDate extends DetailBarberEvent {
  final DateTime date;

  const ChangeScheduleDate(this.date);

  @override
  List<Object> get props => [date];
}

final class ClearPage extends DetailBarberEvent {
  const ClearPage();

  @override
  List<Object> get props => [];
}

final class ShowLocation extends DetailBarberEvent {
  const ShowLocation();

  @override
  List<Object> get props => [];
}

class SelectDateTime extends DetailBarberEvent {
  final DateTime dateTime;

  const SelectDateTime(this.dateTime);

  @override
  List<Object> get props => [dateTime];
}

final class SelectTimeSlot extends DetailBarberEvent {
  final int index;

  const SelectTimeSlot(this.index);

  @override
  List<Object> get props => [index];
}

class SelectTimeSlots extends DetailBarberEvent {
  final  HaircutStylesEntities? haircutStyles;

  const SelectTimeSlots(this.haircutStyles);

  @override
  List<Object?> get props => [haircutStyles];
}

class UnSelectTimeSlots extends DetailBarberEvent {
  final HaircutStylesEntities? index;

  const UnSelectTimeSlots(this.index);

  @override
  List<Object?> get props => [index];
}

final class SelectPaymentServiceEvent extends DetailBarberEvent {
  final int index;

  const SelectPaymentServiceEvent(this.index);

  @override
  List<Object> get props => [index];
}

final class BookingPaymentEvent extends DetailBarberEvent{

  const BookingPaymentEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

