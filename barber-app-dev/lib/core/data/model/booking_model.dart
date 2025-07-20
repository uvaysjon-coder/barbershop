import 'package:barbershop/core/entities/booking_entities.dart';

import 'booking_service_model.dart';

class BookingModel extends BookingEntities {
  const BookingModel({
    super.address,
    super.distanceKm,
    super.largeImageUrl,
    super.rating,
    super.scheduleStartTime,
    super.shopName,
    super.smallImageUrl,
    super.status,
    super.services,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {

    final List<BookingServiceModel> services = [];
     double rating  = 0.0;
     DateTime ? scheduleStartTime;


    if (json['services'] != null) {
      for (var service in json['services']) {
        services.add(BookingServiceModel.fromJson(service));
      }
    }

    if (json['rating'] != null) {
      rating = double.parse(json['rating'].toString());
    }
    //2025-06-05T12:00:00Z
    if (json['scheduleStartTime'] != null) {
      scheduleStartTime = DateTime.parse(json['scheduleStartTime']);
    }

    return BookingModel(
      address: json['address'] ?? "",
      distanceKm: json['distanceKm'] ?? 0.0,
      largeImageUrl: json['largeImageUrl'] ?? "",
      scheduleStartTime: scheduleStartTime,
      rating: rating,
      shopName: json['shopName'] ?? "",
      smallImageUrl: json['smallImageUrl'] ?? "",
      status: json['status'] ?? "",
      services: services,

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'distanceKm': distanceKm,
      'largeImageUrl': largeImageUrl,
      'rating': rating,
      'scheduleStartTime': scheduleStartTime,
      'shopName': shopName,
      'smallImageUrl': smallImageUrl,
      'status': status,
      // 'services': services.map((service) => service.toJson()).toList(),
    };
  }
}
