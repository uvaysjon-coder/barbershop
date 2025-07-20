import '../../entities/barber_entities.dart';

// barber_model.dart

class BarberModel extends BarberEntities {
  const BarberModel({
    required super.id,
    required super.name,
    required super.address,
    required super.phoneNumber,
    super.barberType,
    super.largeImg,
    super.smallImg,
    super.distance,
    super.status,
    super.lat,
    super.long,
    super.rating,
  });

  factory BarberModel.fromJson(Map<String, dynamic> json) {
    return BarberModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      address: json['address']?.toString() ?? '',
      phoneNumber: json['phoneNumber']?.toString() ?? '',
      barberType: json['barberType']?.toString(),
      largeImg: json['largeImageUrl']?.toString(),
      smallImg: json['smallImageUrl']?.toString(),
      distance: json['distance']?.toString(),
      status: json['status']?.toString(),
      lat: json['latitude']?.toString(),
      long: json['longitude']?.toString(),
      rating: json['rating'] != null ? (json['rating'] as num).toDouble() : null,
    );
  }

  factory BarberModel.fromEntity(BarberEntities entity) {
    return BarberModel(
      id: entity.id,
      name: entity.name,
      address: entity.address,
      phoneNumber: entity.phoneNumber,
      barberType: entity.barberType,
      largeImg: entity.largeImg,
      smallImg: entity.smallImg,
      distance: entity.distance,
      status: entity.status,
      lat: entity.lat,
      long: entity.long,
      rating: entity.rating,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'barberType': barberType,
      'largeImageUrl': largeImg,
      'smallImageUrl': smallImg,
      'distance': distance,
      'status': status,
      'latitude': lat,
      'longitude': long,
      'rating': rating,
    };
  }
}
