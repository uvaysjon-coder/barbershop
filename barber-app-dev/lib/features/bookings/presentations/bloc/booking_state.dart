part of 'booking_bloc.dart';

class BookingState extends Equatable {
  final int currentIndex;
  final bool isLoading;
  final List<BookingEntities> activeBookings;
  final List<BookingEntities> completedBookings;
  final String? errorMessage , successMessage;

  const BookingState({
    this.currentIndex = 0,
    this.activeBookings = const [],
    this.completedBookings = const [],
    this.isLoading = false,
    this.errorMessage,
    this.successMessage,
  });

  BookingState copyWith({
    int? currentIndex,
    bool? isLoading,
    List<BookingEntities>? activeBookings,
    List<BookingEntities>? completedBookings,
    String? errorMessage,
    String? successMessage,
  }) {
    return BookingState(
      currentIndex: currentIndex ?? this.currentIndex,
      isLoading: isLoading ?? false,
      activeBookings: activeBookings ?? this.activeBookings,
      completedBookings: completedBookings ?? this.completedBookings,
      errorMessage: errorMessage,
      successMessage: successMessage ,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        currentIndex,
        isLoading,
        activeBookings,
        completedBookings,
        errorMessage,
        successMessage,
      ];
}
