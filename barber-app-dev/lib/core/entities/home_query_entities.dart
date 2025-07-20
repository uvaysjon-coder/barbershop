import 'package:equatable/equatable.dart';

///http://45.92.173.46:5090/api/Shop/Get_NearestLocations?Latitude=0&Longitude=0&HaircutStyles=Basic_haircut&MinRating=4&NearestDistance=0.1&FarthestDistance=10&pageNumber=1&pageSize=10

class HomeQueryEntities extends Equatable {
  final double latitude;
  final double longitude;
  final String? haircutStyles;
  final double? minRating;
  final double? nearestDistance;
  final double? farthestDistance;
  final int pageNumber;
  final int pageSize;
  final String? barberQuery;


  const HomeQueryEntities({
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.haircutStyles,
    this.minRating,
    this.nearestDistance,
    this.farthestDistance,
    this.pageNumber = 1,
    this.pageSize = 10,
    this.barberQuery,
  });

  HomeQueryEntities copyWith({
    double? latitude,
    double? longitude,
    String? haircutStyles,
    double? minRating,
    double? nearestDistance,
    double? farthestDistance,
    int? pageNumber,
    int? pageSize,
    String? barberQuery,
  }) {
    return HomeQueryEntities(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      haircutStyles: haircutStyles ?? this.haircutStyles,
      minRating: minRating ?? this.minRating,
      nearestDistance: nearestDistance ?? this.nearestDistance,
      farthestDistance: farthestDistance ?? this.farthestDistance,
      pageNumber: pageNumber ?? this.pageNumber,
      pageSize: pageSize ?? this.pageSize,
      barberQuery: barberQuery ?? this.barberQuery,
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [
        latitude,
        longitude,
        haircutStyles,
        minRating,
        nearestDistance,
        farthestDistance,
        pageNumber,
        pageSize,
        barberQuery,

      ];

  @override
  String toString() {
    return 'HomeQueryEntities{latitude: $latitude, longitude: $longitude, haircutStyles: $haircutStyles, minRating: $minRating, nearestDistance: $nearestDistance, farthestDistance: $farthestDistance, pageNumber: $pageNumber, pageSize: $pageSize, barberQuery: $barberQuery}';
  }

  HomeQueryEntities reset() {
    return HomeQueryEntities(
      latitude: latitude,
      longitude: longitude,
      haircutStyles: null,
      minRating: null,
      nearestDistance: null,
      farthestDistance: null,
      pageNumber: 1,
      pageSize: 10,
      barberQuery: null,
    );
  }
}
