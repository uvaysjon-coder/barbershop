import 'package:barbershop/features/main/detail_barber/data/model/haircut_styles_model.dart';

import '../../domain/entities/detail_barber_entities.dart';
import '../../domain/entities/haircut_styles_entities.dart';

class DetailBarberModel extends DetailBarberEntities {
  const DetailBarberModel({
    super.shopId = 0,
    super.userId = 0,
    super.name = '',
    super.largeImageUrl = '',
    super.smallImageUrl = '',
    super.phoneNumber = '',
    super.ratedPeopleCount = 0,
    super.address = '',
    super.longitude = 0.0,
    super.latitude = 0.0,
    super.workingWeekDate = '',
    super.startDate = '',
    super.endDate = '',
    super.haircutStyles,
    super.description,
    super.shopType,
    super.rating,
  });

  factory DetailBarberModel.fromJson(Map<String, dynamic> json) {
    final List<HaircutStylesEntities> haircutStyles = [];

    if (json['haircutStyles'] != null && json['haircutStyles'] is List) {
      haircutStyles.addAll((json['haircutStyles'] as List)
          .map((haircutStyleJson) =>
              HaircutStylesModel.fromJson(haircutStyleJson))
          .toList());
    }

    return DetailBarberModel(
      shopId: json['shopId'],
      userId: json['userId'],
      name: json['name'],
      largeImageUrl: json['largeImageUrl'],
      smallImageUrl: json['smallImageUrl'],
      phoneNumber: json['phoneNumber'],
      ratedPeopleCount: json['ratedPeopleCount'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      workingWeekDate: json['workingWeekDate'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      haircutStyles: haircutStyles,
      description: json['description'],
      shopType: json['shopType'],
      rating: json['rating'] ,
    );
  }
}
