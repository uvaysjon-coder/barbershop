/*
*  {
          "serviceName": "Hair_coloring",
          "description": "string",
          "price": "50000",
          "serviceImageUrl": "/2024/Images/ServiceImages/9df1273e-c5bc-4165-a29c-750e2c0cb397_Hair_coloring_barber-terms-hero-scaled-1.jpg"
        },*/

import 'package:equatable/equatable.dart';

class BookingServiceEntities extends Equatable {
  final String serviceName;
  final String description;
  final String price;
  final String serviceImageUrl;

  const BookingServiceEntities({
    this.serviceName = '',
    this.description = '',
    this.price = '',
    this.serviceImageUrl = '',
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        serviceName,
        description,
        price,
        serviceImageUrl,
      ];
}
