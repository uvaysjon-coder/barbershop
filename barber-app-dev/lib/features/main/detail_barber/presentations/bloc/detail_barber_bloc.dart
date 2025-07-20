
import 'package:barbershop/core/data/local/user_storage.dart';
import 'package:barbershop/core/exceptions/failures.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/core/utils/utils.dart';
import 'package:barbershop/features/main/detail_barber/domain/entities/detail_barber_entities.dart';
import 'package:barbershop/features/main/detail_barber/domain/entities/haircut_styles_entities.dart';
import 'package:barbershop/features/main/detail_barber/domain/entities/schedule_entities.dart';
import 'package:barbershop/features/main/detail_barber/domain/entities/time_slot.dart'; // New import
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/di/di.dart';
import '../../domain/repository/detail_barber_repository.dart';

part 'detail_barber_event.dart';

part 'detail_barber_state.dart';

class DetailBarberBloc extends Bloc<DetailBarberEvent, DetailBarberState> {
  DetailBarberBloc() : super(const DetailBarberState()) {
    final repository = sl<DetailBarberRepository>();
    final userId = sl<UserStorage>();


    on<ChangeDetailService>((event, emit) {
      emit(state.copyWith(detailService: event.detailService));
    });

    on<SelectPaymentServiceEvent>((event, emit) {
      emit(state.copyWith(selectPaymentService: event.index));
    });

    on<SelectDateTime>((event, emit) {
      emit(state.copyWith(selectedDate: event.dateTime));
    });
    on<SelectTimeSlot>((event, emit) {
      emit(state.copyWith(selectedTimeSlotIndex: event. index));
    });

    on<SelectTimeSlots>((event, emit) {
      if(event.haircutStyles == null) return;

      if(state.selectedTimeSlots.where((element) => element == event.haircutStyles ).isNotEmpty){
        emit(state.copyWith(selectedTimeSlots: [...state.selectedTimeSlots]..remove(event.haircutStyles!)));
        return;
      }

      // Check if the time slot is already selected
      emit(state.copyWith(selectedTimeSlots: [...state.selectedTimeSlots,event.haircutStyles!]));
    });

    on<BookingPaymentEvent>((event , emit) async {
      emit(state.copyWith(isLoading: true));
      final List<String> services = [];

      for (var element in state.selectedTimeSlots) {
        services.add(element.id.toString());
      }

      final selectedTimeString = state.timeSlots[state.selectedTimeSlotIndex!].time;
      final timeParts = selectedTimeString.split(':');
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);
      final now = DateTime.now();
      final offset = now.timeZoneOffset.inHours;

      final selectedDateTime = DateTime(
        state.selectedDate!.year,
        state.selectedDate!.month,
        state.selectedDate!.day,
        hour + offset,
        minute,
      );
      final id = userId.getUser();

      final result = await repository.bookingBarber(
        state.detailBarber?.shopId.toString() ?? "",
        id?.id.toString() ?? "",
        services,
        selectedDateTime,
      );
      result.either(
        (failure) {

          if (failure is UserFailure) {
            pPrint("DetailBarberBloc Error ${failure.errorMessage}");
            emit(state.copyWith(
              errorMessage: failure.errorMessage,
              status: DetailBarberStatus.failure,
            ));
          } else if (failure is DioFailure){
            pPrint("DetailBarberBloc Error ${failure.errorMessage}");
            emit(state.copyWith(
              errorMessage: failure.errorMessage,
              status: DetailBarberStatus.failure,
            ));
          } else {
            pPrint("DetailBarberBloc Error ${failure.toString()}");
            emit(state.copyWith(
              errorMessage: failure.toString(),
              status: DetailBarberStatus.failure,
            ));
          }

        },
        (data) {
          emit(state.copyWith(
            successMessage: data.message,
            status: DetailBarberStatus.success,
          ));
        },
      );

    });

    on<UnSelectTimeSlots>((event, emit) {
      if(event.index == null) return;
      // Check if the time slot is already selected
      emit(state.copyWith(selectedTimeSlots: [...state.selectedTimeSlots]..remove(event.index!)));
    });
    on<GetDetailBarber>((event, emit) async {

      emit(state.reset());
      final result = await repository.getDetailBarber(event.id);
      result.either(
        (failure) {
          emit(state.copyWith( ));
        },
        (data) {
          emit(state.copyWith(isLoading: false, detailBarber: data));
        },
      );

      final resultSchedule =
          await repository.getScheduleBarber(event.id, DateTime.now());
      resultSchedule.either(
        (failure) {
          emit(state.copyWith(isLoading: false));
        },
        (data) {
          final List<ScheduleEntities> barberBookingTime = data;
          final List<TimeSlot> timeSlots =
              _generateTimeSlots(DateTime.now(), barberBookingTime);

          emit(state.copyWith(
            isLoading: false,
            barberWorkTime: data,
            timeSlots: timeSlots,
            selectedDate: DateTime.now(),
          ));
        },
      );
    });

    on<ChangeScheduleDate>((event, emit) async {
      emit(state.copyWith(selectedDate: event.date,));
      // Get schedule for the selected date
      final resultSchedule = await repository.getScheduleBarber(
          state.detailBarber?.shopId.toString() ?? "", event.date);

      resultSchedule.either(
        (failure) {
          if (failure is UserFailure) {
            pPrint("DetailBarberBloc Error ${failure.errorMessage}");
          }
          pPrint('DetailBarberBloc Error ${failure.toString()}');
        },
        (data) {
          final List<ScheduleEntities> barberBookingTime = data;
          final List<TimeSlot> timeSlots =
              _generateTimeSlots(event.date, barberBookingTime);

          emit(state.copyWith(
            barberWorkTime: data,
            timeSlots: timeSlots,
            selectedDate: event.date,
          ));
        },
      );
    });

    on<ClearPage>((event, emit) {
      emit(const DetailBarberState());
    });

    on<ShowLocation>((event, emit) async {


      pPrint("ShowLocation");
      await openMap(state.detailBarber!.latitude, state.detailBarber!.longitude);
      // Implement if needed
    });


  }

  List<TimeSlot> _generateTimeSlots(DateTime date, List<ScheduleEntities> bookings) {
    final List<TimeSlot> timeSlots = [];

    // Get barber's start and end times from detailBarber
    final startTimeStr = state.detailBarber?.startDate ?? "09:00:00";
    final endTimeStr = state.detailBarber?.endDate ?? "18:00:00";

    // Parse times to get hours and minutes
    final startHourMinute = startTimeStr.split(':');
    final endHourMinute = endTimeStr.split(':');

    // Convert to double for looping (e.g., 9.0, 9.5, 10.0, etc.)
    final startHour = double.parse(startHourMinute[0]);
    final startMinute = int.parse(startHourMinute[1]);
    // Adjust start hour if minutes are 30
    final adjustedStartHour = startMinute == 30 ? startHour + 0.5 : startHour;

    final endHour = double.parse(endHourMinute[0]);
    final endMinute = int.parse(endHourMinute[1]);
    // Adjust end hour if minutes are 30
    final adjustedEndHour = endMinute == 30 ? endHour + 0.5 : endHour;

    // Generate all possible time slots based on barber's working hours
    for (double hour = adjustedStartHour; hour <= adjustedEndHour; hour += 0.5) {
      int intHour = hour.toInt();
      String minute = (hour - intHour) == 0 ? "00" : "30";
      String timeString = "${intHour.toString().padLeft(2, '0')}:$minute";

      // Check if this time slot is booked
      bool isBooked = false;

      // Convert the current time slot to a DateTime for today
      final timeComponents = timeString.split(':');
      final timeHour = int.parse(timeComponents[0]);
      final timeMinute = int.parse(timeComponents[1]);
      final timeSlotDateTime = DateTime(
          date.year, date.month, date.day, timeHour, timeMinute
      );

      // Check each booking
      for (final booking in bookings) {
        // Extract just the time part from the booking
        // Example: "2025-04-28T09:00:00Z" -> Extract "09:00"
        final bookingStartParts = booking.scheduleStartTime.split('T')[1].split(':');
        final bookingEndParts = booking.scheduleEndTime.split('T')[1].split(':');

        final bookingStartHour = int.parse(bookingStartParts[0]);
        final bookingStartMinute = int.parse(bookingStartParts[1]);
        final bookingEndHour = int.parse(bookingEndParts[0]);
        final bookingEndMinute = int.parse(bookingEndParts[1]);

        // Create DateTime objects for the booking start and end times (in UTC)
        final bookingStartTime = DateTime.utc(
            date.year, date.month, date.day, bookingStartHour, bookingStartMinute
        );
        final bookingEndTime = DateTime.utc(
            date.year, date.month, date.day, bookingEndHour, bookingEndMinute
        );

        // Convert the time slot to UTC for comparison
        final timeSlotDateTimeUTC = DateTime.utc(
            date.year, date.month, date.day, timeHour, timeMinute
        );

        // Check if this time slot falls within the booking (compare in UTC)
        if (timeSlotDateTimeUTC.isAfter(bookingStartTime.subtract(const Duration(minutes: 1))) &&
            timeSlotDateTimeUTC.isBefore(bookingEndTime)) {
          isBooked = true;
          pPrint('Marking $timeString as booked (matches UTC time $bookingStartHour:${bookingStartMinute.toString().padLeft(2, '0')})');
          break;
        }
      }

      timeSlots.add(TimeSlot(time: timeString, isBooked: isBooked));
    }

    return timeSlots;
  }

}
