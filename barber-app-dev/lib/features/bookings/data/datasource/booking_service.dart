import 'package:barbershop/core/constants/urls.dart';
import 'package:dio/dio.dart';

abstract interface class BookingService {
  Future<Response> getAllBooking({
    required String barberId,
  });           
}

class BookingServiceImpl implements BookingService {
  final Dio dio;

  BookingServiceImpl(this.dio);

  @override
  Future<Response> getAllBooking({
    required String barberId,
  }) async {
    final response = await dio.get(
      AppUrls.bookingSort,
      queryParameters: {
        'AppUserId': barberId,
        'Longitude': 0,
        'Latitude': 0,
      },
    );
    return response;
  }
}
