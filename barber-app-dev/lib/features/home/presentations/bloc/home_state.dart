part of 'home_bloc.dart';

class HomeState extends Equatable {
  final UserEntities? user;
  final HomeQueryEntities homeQueryEntities;
  final int currentIndex,totalPage,pageNumber;


  final bool isLoading;
  final bool pageLoading;
  final EventHome? eventHome;
  final bool? locationPermission;
  final List<BarberEntities>? barberEntities;
  final List<BarberEntities>? topEntities;
  final List<BarberEntities>? homeBarberEntities;

  final String? barberId,errorMessage;


  const HomeState({
    this.eventHome,
    this.barberEntities,
    this.barberId,
    this.isLoading = false,
    this.pageLoading = false,
    this.homeQueryEntities = const HomeQueryEntities(),
    this.currentIndex = 0,
    this.pageNumber = 1,
    this.totalPage = 1,
    this.user,
    this.topEntities,
    this.homeBarberEntities,
    this.errorMessage,
    this.locationPermission,
  });

  factory HomeState.initial() {
    return const HomeState();
  }

  HomeState copyWith({
    int? currentIndex,
    UserEntities? user,
    EventHome? eventHome,
    bool? locationPermission,
    List<BarberEntities>? barberEntities,
    List<BarberEntities>? topEntities,
    List<BarberEntities>? homeBarberEntities,
    HomeQueryEntities? homeQueryEntities,
    String? barberId,
    bool? isLoading,
    String? errorMessage,
    int? pageNumber,
    int? totalPage,
    bool? pageLoading,
  }) {
    return HomeState(
      eventHome: eventHome,
      barberId: barberId,
      homeQueryEntities: homeQueryEntities ?? this.homeQueryEntities,
      topEntities: topEntities ?? this.topEntities,
      barberEntities: barberEntities ?? this.barberEntities,
      currentIndex: currentIndex ?? this.currentIndex,
      user: user ?? this.user,
      errorMessage: errorMessage,
      isLoading: isLoading ?? false,
      pageLoading: pageLoading ?? false,
      homeBarberEntities: homeBarberEntities ?? this.homeBarberEntities,
      locationPermission: locationPermission ?? this.locationPermission,
      pageNumber: pageNumber ?? this.pageNumber,
      totalPage: totalPage ?? this.totalPage,
    );
  }




  @override
  // TODO: implement props
  List<Object?> get props => [
        currentIndex,
        user,
        eventHome,
        locationPermission,
        barberEntities,
        barberId,
        homeQueryEntities,
        topEntities,
        isLoading,
        errorMessage,
        homeBarberEntities,
        pageNumber,
        totalPage,
        pageLoading,
      ];
}

enum EventHome { filterSummitButton, exploreBarberPage }
