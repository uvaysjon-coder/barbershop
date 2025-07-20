import 'dart:async';

import 'package:barbershop/core/data/local/user_storage.dart';
import 'package:barbershop/core/entities/barber_entities.dart';
import 'package:barbershop/core/entities/home_query_entities.dart';
import 'package:barbershop/core/exceptions/failures.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/features/home/domain/repository/home_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/di/di.dart';
import '../../../../core/entities/user_entities.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository homeRepository = sl<HomeRepository>();
  final UserStorage userStorage = sl<UserStorage>();
  bool _locationFetched = false;

  List<BarberEntities> homeBarberEntities = [];
  List<BarberEntities> topEntities = [];

  HomeBloc() : super(const HomeState()) {

    getRestart();
    // Sahifa indeksini o'zgartirish
    on<ChangePageIndex>(_onChangePageIndex);

    // Filter tugmasi bosilganda
    on<FilterSummitButton>(_onFilterSummitButton);

    // State ni qayta qurish
    on<BuildState>(_onBuildState);

    // Sartaroshlarni ko'rish
    on<ExploreBarber>(_onExploreBarber);

    // Home sahifasiga kirish
    on<HomePageEntered>(_onHomePageEntered);

    // Foydalanuvchi lokatsiyasi aniqlanganda
    on<UserLocation>(_onUserLocation);

    // Foydalanuvchi lokatsiya ruxsatini rad etganda
    on<UserDeniedLocation>(_onUserDeniedLocation);

    on<GetBarber>(_onGetBarber);
    on<RefreshBarbers>(_refreshBarbers);
    on<SearchBarber>(_onSearchBarber);

    on<FilterHaircutStyles>(_onFilterHaircutStyles);

    on<FilterReset>(_onFilterReset);
     on<FilterSaveButton>(_onFilterSaveButton);

     on<FilterFarthestDistance>(_onFilterFarthestDistance);
    on<FilterNearestDistance>(_onFilterNearestDistance);
    on<FilterMinRating>(_onFilterMinRating);
    on<PaginationBarbers>(_onPaginationBarbers);

  }

  // Event handlerlar
  void _onChangePageIndex(ChangePageIndex event, Emitter<HomeState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }

  void _onFilterSummitButton(FilterSummitButton event, Emitter<HomeState> emit) {
    emit(state.copyWith(eventHome: EventHome.filterSummitButton));
  }

  void _onBuildState(BuildState event, Emitter<HomeState> emit) {
    emit(state.copyWith());
  }

  void _onExploreBarber(ExploreBarber event, Emitter<HomeState> emit) {
    emit(state.copyWith(eventHome: EventHome.exploreBarberPage));
  }

  void _onHomePageEntered(HomePageEntered event, Emitter<HomeState> emit) {
    if (!_locationFetched) {
      getPermission();
    }
  }

  Future<void> _onUserLocation(UserLocation event, Emitter<HomeState> emit) async {
    _locationFetched = true;
    emit(state.copyWith(locationPermission: true));

    final lat = event.position.latitude;
    final long = event.position.longitude;
    final user = userStorage.getUser();

    try {

      emit(state.copyWith(isLoading: true,

          homeQueryEntities: state.homeQueryEntities.copyWith(
            latitude: lat,
            longitude: long,

          ),user: user));
      final home = await homeRepository.getHome(state.homeQueryEntities );
      home.either(
              (error) {
            // Xato bo'lganda
            if (error is DioFailure) {
              pPrint(error.errorMessage);
              emit(state.copyWith(barberEntities: [] ));

            } else if (error is UserFailure) {
              pPrint(error.errorMessage);
              emit(state.copyWith(barberEntities: [] ));

            }

            pPrint("Lokatsiya ma'lumotlarini olishda xatolik: $error");
            emit(state.copyWith(barberEntities: [] ));
            // emit(state.copyWith(errorMessage: error.toString()));
          },
              (data) {
                // final barberEntities = data.barbers;
                // if(barberEntities.length >6){
                //
                //   final topEntities = barberEntities.sublist(0, 6);
                //
                //
                //
                //   emit(state.copyWith(homeBarberEntities: data.barbers,barberEntities: data.barbers,topEntities:topEntities ,pageNumber: data.currentPage,totalPage: data.totalPages));
                //   return;
                // }

                homeBarberEntities.addAll(data.barbers);
                topEntities.addAll(data.barbers);
            // Ma'lumotlar muvaffaqiyatli olinganda
                emit(state.copyWith(topEntities: data.barbers,homeBarberEntities: data.barbers,barberEntities: data.barbers ,pageNumber: data.currentPage,totalPage: data.totalPages));
          }
      );
    } catch (e) {
      pPrint("Home data olishda xatolik: $e");
      // emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  void _onUserDeniedLocation(UserDeniedLocation event, Emitter<HomeState> emit) {
    _locationFetched = true;
    emit(state.copyWith(locationPermission: false));
  }

  // Lokatsiya ruxsatlarini tekshirish
  Future<void> getPermission() async {
    try {
      // Avval joriy ruxsatni tekshirish
      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Geolocator.openAppSettings();
          add(UserDeniedLocation());
          return;
        }
      }

      // Ruxsat butunlay rad etilgan holat
      if (permission == LocationPermission.deniedForever) {
        // Foydalanuvchini ilova sozlamalariga yo'naltirish
        Geolocator.openAppSettings();
        add(UserDeniedLocation());
        return;
      }

      // Joriy lokatsiyani olish
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
          distanceFilter: 10,

          timeLimit: Duration(
            seconds: 10,
          ),

        ),
      );

      add(UserLocation(position));
    } catch (e) {
      pPrint("Lokatsiya ruxsati olishda xatolik: $e");
      add(UserDeniedLocation());
    }
  }

  @override
  Future<void> close() {
    // Bu yerda agar biror subscription yoki stream ishlatilgan bo'lsa, ularni yopish kerak
    return super.close();
  }

  FutureOr<void> _onGetBarber(GetBarber event, Emitter<HomeState> emit) {
    emit(state.copyWith(barberId: event.id));
  }

  FutureOr<void> _onSearchBarber(SearchBarber event, Emitter<HomeState> emit) async {

    emit(state.copyWith(isLoading: true,homeQueryEntities: state.homeQueryEntities.copyWith(
      barberQuery: event.query
    )));
    final result =await homeRepository.getHome(state.homeQueryEntities,);
    result.either((error){
      // Xato bo'lganda
      pPrint("Lokatsiya ma'lumotlarini olishda xatolik: $error");
      emit(state.copyWith(barberEntities: [],));
      // emit(state.copyWith(errorMessage: error.toString()));
    }, (data){
      pPrint(data.barbers,1);
      // Ma'lumotlar muvaffaqiyatli olinganda
      emit(state.copyWith(barberEntities: data.barbers,pageNumber: data.currentPage,totalPage: data.totalPages));


    });


  }

  FutureOr<void> _refreshBarbers(RefreshBarbers event, Emitter<HomeState> emit) async{

    emit(state.copyWith(isLoading: true,homeQueryEntities: state.homeQueryEntities.copyWith(
      pageNumber: 1,
    )));
    pPrint(state.homeQueryEntities.haircutStyles);
    final result =await homeRepository.getHome(state.homeQueryEntities);

      result.either((error) {
        // Xato bo'lganda
        pPrint("Lokatsiya ma'lumotlarini olishda xatolik: $error");
        emit(state.copyWith(barberEntities: [],));
        // emit(state.copyWith(errorMessage: error.toString()));
      }, (data) {
        pPrint(data.barbers, 1);
        // Ma'lumotlar muvaffaqiyatli olinganda
        emit(state.copyWith(barberEntities: data.barbers,pageNumber: data.currentPage,totalPage: data.totalPages));


      });

  }

  FutureOr<void> _onFilterHaircutStyles(FilterHaircutStyles event, Emitter<HomeState> emit) {
    emit(state.copyWith(homeQueryEntities: state.homeQueryEntities.copyWith(
      haircutStyles: event.haircutStyles
    )));
  }

  FutureOr<void> _onFilterReset(FilterReset event, Emitter<HomeState> emit) {

    emit(state.copyWith(homeQueryEntities: state.homeQueryEntities.reset()));
    pPrint(state.homeQueryEntities.toString(),2);
    add(RefreshBarbers());

  }

  FutureOr<void> _onFilterSaveButton(FilterSaveButton event, Emitter<HomeState> emit) async{
    emit(state.copyWith(isLoading: true));

    final result = await homeRepository.getHome(state.homeQueryEntities);
    result.either((error) {
      if(error is DioFailure){
        pPrint(error.errorMessage);
      }else if(error is UserFailure){
        pPrint(error.errorMessage);
      }

      // Xato bo'lganda
      pPrint("Lokatsiya ma'lumotlarini olishda xatolik: $error");
      emit(state.copyWith(barberEntities: [],));
      // emit(state.copyWith(errorMessage: error.toString()));
    }, (data) {
      pPrint(data.barbers, 1);
      // Ma'lumotlar muvaffaqiyatli olinganda
      emit(state.copyWith(barberEntities: data.barbers,pageNumber: data.currentPage,totalPage: data.totalPages));


    });



  }

  FutureOr<void> _onFilterFarthestDistance(FilterFarthestDistance event, Emitter<HomeState> emit) {
    emit(state.copyWith(homeQueryEntities: state.homeQueryEntities.copyWith(
      farthestDistance: event.farthestDistance
    )));
  }

  FutureOr<void> _onFilterNearestDistance(FilterNearestDistance event, Emitter<HomeState> emit) {
    emit(state.copyWith(homeQueryEntities: state.homeQueryEntities.copyWith(
      nearestDistance: event.nearestDistance
    )));
  }

  FutureOr<void> _onFilterMinRating(FilterMinRating event, Emitter<HomeState> emit) {
    emit(state.copyWith(homeQueryEntities: state.homeQueryEntities.copyWith(
      minRating: event.minRating
    )));
  }

  FutureOr<void> _onPaginationBarbers(PaginationBarbers event, Emitter<HomeState> emit) async{

    if(state.pageNumber == state.totalPage){
      emit(state.copyWith(isLoading: false));
      return;
    }
    emit(state.copyWith(homeQueryEntities: state.homeQueryEntities.copyWith(
      pageNumber: state.homeQueryEntities.pageNumber + 1,
    ),pageLoading: true));
    final result = await homeRepository.getHome(state.homeQueryEntities);
    result.either((error) {

      if(error is UserFailure){
        pPrint(error.errorMessage);
        emit(state.copyWith(barberEntities: [] ,errorMessage: error.errorMessage ));
      }
      // Xato bo'lganda
      pPrint("Pagination error: $error");
      emit(state.copyWith(barberEntities: [],));
      // emit(state.copyWith(errorMessage: error.toString()));
    }, (data) {
      pPrint(data.barbers, 1);
      // Ma'lumotlar muvaffaqiyatli olinganda
      emit(state.copyWith(barberEntities: [...state.barberEntities! ,...data.barbers ,],pageNumber: data.currentPage,totalPage: data.totalPages));


    });
  }

  void getRestart() {
    _locationFetched = false;
  }
}