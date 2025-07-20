
import 'package:barbershop/core/constants/urls.dart';
import 'package:barbershop/core/data/model/home_query_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/entities/home_query_entities.dart';

abstract class HomeService {
  Future<Response> getHome(HomeQueryEntities homeQueryEntities);
}

class HomeServiceImpl implements HomeService {

  final Dio dio;

  HomeServiceImpl(this.dio);

  @override
  Future<Response> getHome( homeQueryEntities) async {

    final HomeQueryModel query = HomeQueryModel(
      latitude: homeQueryEntities.latitude,
      longitude: homeQueryEntities.longitude,
      haircutStyles: homeQueryEntities.haircutStyles,
      minRating: homeQueryEntities.minRating,
      nearestDistance: homeQueryEntities.nearestDistance,
      farthestDistance: homeQueryEntities.farthestDistance,
      pageNumber: homeQueryEntities.pageNumber,
      pageSize: homeQueryEntities.pageSize,
      barberQuery: homeQueryEntities.barberQuery
    );

    return await dio.get(
      AppUrls.homeGet,
      queryParameters: query.toJson(),
    );



  }
}