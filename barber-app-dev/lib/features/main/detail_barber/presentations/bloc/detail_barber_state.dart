part of 'detail_barber_bloc.dart';

class DetailBarberState extends Equatable {
  final DetailServiceEvent detailService;
  final bool isLoading;
  final DetailBarberEntities? detailBarber;
  final List<ScheduleEntities> barberWorkTime;
  final List<TimeSlot> timeSlots; // New field
  final DateTime? selectedDate; // New field
  final int? selectedTimeSlotIndex; // New field
  final int? selectPaymentService; // New field
  final List<HaircutStylesEntities> selectedTimeSlots ;
  final DetailBarberStatus? status;
  final String? errorMessage,successMessage;

  const DetailBarberState({

    this.status,
    this.errorMessage,
    this.successMessage,
    this.selectPaymentService,
    this.detailService = DetailServiceEvent.about,
    this.isLoading = false,
    this.detailBarber,
    this.selectedTimeSlotIndex,
    this.barberWorkTime = const [],
    this.selectedTimeSlots = const [],
    this.timeSlots = const [], // Initialize with empty list
    this.selectedDate,
  });


  DetailBarberState reset() {
    return const DetailBarberState(
      detailService: DetailServiceEvent.about,
      isLoading: true,
      detailBarber: null,
      barberWorkTime: [],

      timeSlots: [],
      selectedDate: null,
      selectPaymentService: null,
      selectedTimeSlotIndex: null,
      selectedTimeSlots: [],
    );
  }

  DetailBarberState copyWith({
    DetailServiceEvent? detailService,
    String? errorMessage,
    String? successMessage,
    bool? isLoading,
    DetailBarberEntities? detailBarber,
    List<ScheduleEntities>? barberWorkTime,
    List<TimeSlot>? timeSlots,
    DateTime? selectedDate,
    int? selectedTimeSlotIndex,
    int? selectPaymentService,
    DetailBarberStatus? status,
    List<HaircutStylesEntities>? selectedTimeSlots,
  }) {
    pPrint('DetailBarberState copyWith ${detailBarber?.name}');
    return DetailBarberState(
      status: status ?? this.status,
      selectPaymentService: selectPaymentService ?? this.selectPaymentService,
      selectedTimeSlotIndex: selectedTimeSlotIndex ?? this.selectedTimeSlotIndex,
      detailService: detailService ?? this.detailService,
      isLoading: isLoading ?? false,
      detailBarber: detailBarber ?? this.detailBarber,
      barberWorkTime: barberWorkTime ?? this.barberWorkTime,
      timeSlots: timeSlots ?? this.timeSlots,
      selectedDate: selectedDate ?? this.selectedDate,
      errorMessage: errorMessage,
      successMessage: successMessage ,
      selectedTimeSlots: selectedTimeSlots ?? this.selectedTimeSlots,
    );
  }

  @override
  List<Object?> get props => [
    detailService,
    isLoading,
    detailBarber,
    barberWorkTime,
    timeSlots,
    selectedTimeSlotIndex,
    selectedDate,
    selectPaymentService,
    selectedTimeSlots,
    status,
  ];
}

enum DetailBarberStatus {
  success,
  failure,
}

enum DetailServiceEvent {
  about,
  services,
  schedule,
  reviews,
}