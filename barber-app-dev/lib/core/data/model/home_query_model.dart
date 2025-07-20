import 'package:barbershop/core/entities/home_query_entities.dart';

class HomeQueryModel extends HomeQueryEntities {
  const HomeQueryModel({
    super.latitude,
    super.longitude,
    super.haircutStyles,
    super.minRating,
    super.nearestDistance,
    super.farthestDistance,
    super.pageNumber = 1,
    super.pageSize = 10,
    super.barberQuery
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {
      'Latitude': latitude,
      'Longitude': longitude,
      'pageNumber': pageNumber,
      'pageSize': pageSize,
    };

    if (haircutStyles != null) {
      json['HaircutStyles'] = haircutStyles;
    }

    if (minRating != null) {
      json['MinRating'] = minRating;
    }

    if (nearestDistance != null) {
      json['NearestDistance'] = nearestDistance;
    }

    if (farthestDistance != null) {
      json['FarthestDistance'] = farthestDistance;
    }
    if (barberQuery != null) {
      json['SearchTerm'] = barberQuery;
    }

    return json;
  }
}
