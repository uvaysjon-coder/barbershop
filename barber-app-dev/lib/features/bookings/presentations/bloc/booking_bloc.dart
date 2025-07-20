import 'package:barbershop/core/utils/print.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/data/local/user_storage.dart';
import '../../../../core/di/di.dart';
import '../../../../core/entities/booking_entities.dart';
import '../../../../core/exceptions/failures.dart';
import '../../domain/repository/booking_repository.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(const BookingState()) {

    final repository = sl<BookingRepository>();
    final userStorage = sl<UserStorage>();

    on<GetAllBookingEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final userId = userStorage.getUser()?.id.toString() ?? "";

      final result = await repository.getAllBooking(userId);
      result.either(
        (failure) {

          pPrint("error $failure");
          if (failure is UserFailure) {
            emit(state.copyWith(
              isLoading: false,
              errorMessage: failure.errorMessage,
            ));
          } else if (failure is DioFailure) {
            emit(state.copyWith(
              isLoading: false,
              errorMessage: failure.errorMessage,
            ));
          }

          emit(state.copyWith(
            isLoading: false,
            activeBookings: [],
            completedBookings: [],
          ));
        },
        (data) {
          pPrint("data $data");

          data.sort((a, b) {
            if (a.scheduleStartTime == null || b.scheduleStartTime == null) {
              return 0;
            }
            return a.scheduleStartTime!.compareTo(b.scheduleStartTime!);
          });

          final activeBookings = data.where((element) => element.status.toLowerCase() == "active").toList();
          final completedBookings = data.where((element) => element.status.toLowerCase() == "completed").toList();

          emit(state.copyWith(
            activeBookings: activeBookings,
            completedBookings: completedBookings,
          ));
        },
      );



    });
    on<BookingChangeTabIndex>((event, emit) {
      emit(state.copyWith(
        currentIndex: event.index
      ));
      // TODO: implement event handler
    });
  }
}
