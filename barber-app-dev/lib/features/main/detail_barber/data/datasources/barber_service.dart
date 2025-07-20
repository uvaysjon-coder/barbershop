import 'package:barbershop/core/constants/urls.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:dio/dio.dart';

abstract interface class BarberService {
  Future<Response> getDetailBarber(String id);

  Future<Response> getSchedules(String id, String date);

  Future<Response> bookingBarber(
      String barberId, String userID, List<String> services, DateTime dateTime);
}

class BarberServiceImpl implements BarberService {
  final Dio dio;

  BarberServiceImpl(this.dio);

  @override
  Future<Response> getDetailBarber(String id) async {
    return await dio.get(AppUrls.detailBarber, queryParameters: {'ShopId': id});
  }

  @override
  Future<Response> getSchedules(String id, String date) async {
    return await dio.get(AppUrls.scheduleBarber,
        queryParameters: {'ShopId': id, 'SelectedDate': date});
  }

  @override
  Future<Response> bookingBarber(String barberId, String userID,
      List<String> services, DateTime dateTime) async {
    pPrint("services $services", 1);
    // curl -X 'POST' \
    // 'http://45.92.173.46:5090/api/ShopSchedule' \
    // -H 'accept: */*' \
    // -H 'Content-Type: multipart/form-data' \
    // -F 'ShopId=1' \
    // -F 'AppUserId=2' \
    // -F 'ShopServiceIds=1' \
    // -F 'ShopServiceIds=4' \
    // -F 'ShopServiceIds=25' \
    // -F 'ScheduleStartTime=2025-05-06T12:00:00.000Z'

    final formData = FormData();
    formData.fields.add(MapEntry('ShopId', barberId));
    formData.fields.add(MapEntry('AppUserId', userID));
    formData.fields.add(
        MapEntry('ScheduleStartTime', dateTime.toUtc().toIso8601String()));

    for (var service in services) {
      formData.fields.add(MapEntry('ShopServiceIds', service));
    }
    pPrint("formData ${formData.fields}", 1);

    return await dio.post(
      AppUrls.bookingBarber,

      options: Options(
        headers: {
          'accept': '*/*',
          'Content-Type': 'multipart/form-data',
        },
      ),
      data: formData,
    );

    // TODO: implement bookingBarber
    throw UnimplementedError();
  }
}
