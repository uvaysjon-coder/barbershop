import 'package:barbershop/core/data/local/app_storage.dart';
import 'package:barbershop/core/data/local/shared_preferences_impl.dart';
import 'package:barbershop/core/data/local/token_storage.dart';
import 'package:barbershop/core/data/local/user_storage.dart';
import 'package:barbershop/features/auth/forgot/data/api/forget_service.dart';
import 'package:barbershop/features/auth/register/data/api/register_api.dart';
import 'package:barbershop/features/auth/register/domain/repository/register_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/forgot/data/repository/forgot_repository_impl.dart';
import '../../features/auth/forgot/domain/repository/forgot_repository.dart';
import '../../features/auth/login/data/api/login_api.dart';
import '../../features/auth/login/data/repository/login_repository_impl.dart';
import '../../features/auth/login/domain/repository/login_repository.dart';
import '../../features/auth/otp/data/api/otp_api.dart';
import '../../features/auth/otp/data/repository/otp_repository_impl.dart';
import '../../features/auth/otp/domain/repository/otp_repository.dart';
import '../../features/auth/register/data/repository/register_repository_impl.dart';
import '../../features/bookings/data/datasource/booking_service.dart';
import '../../features/bookings/data/repository/booking_repository_impl.dart';
import '../../features/bookings/domain/repository/booking_repository.dart';
import '../../features/home/data/repository/home_repository_impl.dart';
import '../../features/home/data/service/api_service.dart';
import '../../features/home/domain/repository/home_repository.dart';
import '../../features/main/detail_barber/data/datasources/barber_service.dart';
import '../../features/main/detail_barber/data/repository/detail_barber_repository_impl.dart';
import '../../features/main/detail_barber/domain/repository/detail_barber_repository.dart';
import '../../features/profile/data/datasourse/profile_service.dart';
import '../../features/profile/data/repository/profile_repository_impl.dart';
import '../../features/profile/domain/profile_repository.dart';
import '../data/local/base_storage.dart';
import '../network/dio_settings.dart';

final sl = GetIt.instance;

Future<void> setupInit() async {
  final SharedPreferences pref = await SharedPreferences.getInstance();

  /// register local storage
  sl.registerLazySingleton<BaseStorage>(() => SharedPreferencesImpl(pref));
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage(sl<BaseStorage>()));
  sl.registerLazySingleton<AppStorage>(() => AppStorage(sl<BaseStorage>()));
  sl.registerLazySingleton<UserStorage>(() => UserStorage(sl<BaseStorage>()));

  final dioClient = AppDioClient(tokenStorage: sl<TokenStorage>());
  final dio = dioClient.createDio();

  sl.registerLazySingleton<Dio>(() => dio);

  /// register another dependencies
  sl.registerLazySingleton<RegisterApi>(() => RegisterApiImpl(sl<Dio>()));
  sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(sl<RegisterApi>()));

  /// otp dependencies
   sl.registerLazySingleton<OtpApi>(() => OtpApiImpl(sl<Dio>()));
   sl.registerLazySingleton<OtpRepository>(() => OtpRepositoryImpl(sl<OtpApi>()));

   /// login dependencies
  sl.registerLazySingleton<LoginApi>(() => LoginApiImpl(sl<Dio>()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl<LoginApi>()));

  /// forgot dependencies

  sl.registerLazySingleton<ForgotService>(() => ForgetServiceImpl(sl<Dio>()));
  sl.registerLazySingleton<ForgotRepository>(() => ForgotRepositoryImpl(sl<ForgotService>()));

  /// home dependencies
  sl.registerLazySingleton<HomeService>(() => HomeServiceImpl(sl<Dio>()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl<HomeService>()));


  /// detail barber dependencies

  sl.registerLazySingleton<BarberService>(() => BarberServiceImpl(sl<Dio>()));
  sl.registerLazySingleton<DetailBarberRepository>(() => DetailBarberRepositoryImpl(sl<BarberService>()));

  /// profile dependencies

   sl.registerLazySingleton<ProfileService>(() => ProfileServiceImpl(sl<Dio>()));
   sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(sl<ProfileService>()));


  /// booking dependencies

  sl.registerLazySingleton<BookingService>(() => BookingServiceImpl(sl<Dio>()));
  sl.registerLazySingleton<BookingRepository>(() => BookingRepositoryImpl(sl<BookingService>()));

}

