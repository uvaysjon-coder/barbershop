import 'package:barbershop/core/entities/booking_service_entities.dart';

class BookingServiceModel extends BookingServiceEntities {
  const BookingServiceModel({
    super.description,
    super.price,
    super.serviceImageUrl,
    super.serviceName,
  });



  factory BookingServiceModel.fromJson(Map<String, dynamic> json) {
    return BookingServiceModel(
      description: json['description'] ?? "",
      price: json['price']  ?? 0,
      serviceImageUrl: json['serviceImageUrl'] ?? "",
      serviceName: json['serviceName'] ?? "",
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'price': price,
      'serviceImageUrl': serviceImageUrl,
      'serviceName': serviceName,
    };
  }

}
