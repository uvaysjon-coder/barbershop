/*
{
      "shopName": "NEW Barber",
      "address": "Shayxontoxur",
      "rating": 0,
      "scheduleStartTime": "2025-06-05T12:00:00Z",
      "largeImageUrl": "/2024/Images/ShopImages/012f806d-0d79-49e8-b194-83be895a3a41_NEW Barber_large_barber-terms-hero-scaled-1.jpg",
      "smallImageUrl": "/2024/Images/ShopImages/fca3bc7e-a9c9-4ce6-a792-f983568b3923_NEW Barber_small_barber-terms-hero-scaled-1.jpg",
      "status": "Active",
      "services": [
        {
          "serviceName": "Hair_coloring",
          "description": "string",
          "price": "50000",
          "serviceImageUrl": "/2024/Images/ServiceImages/9df1273e-c5bc-4165-a29c-750e2c0cb397_Hair_coloring_barber-terms-hero-scaled-1.jpg"
        },
        {
          "serviceName": "Special_Massage",
          "description": "string",
          "price": "70000",
          "serviceImageUrl": "/2024/Images/ServiceImages/03535991-60c9-4ccf-9c05-ff973b863117_Special_Massage_barber-terms-hero-scaled-1.jpg"
        },
        {
          "serviceName": "Basic_haircut",
          "description": "easy-peasy",
          "price": "40000",
          "serviceImageUrl": "/2024/Images/ServiceImages/285d5993-9c07-4488-8731-3d5fbaa4e930_Basic_haircut_istockphoto-938631018-612x612.jpg"
        }
      ],
      "distanceKm": 6130.98
    },
*
* */


import 'package:equatable/equatable.dart';

import 'booking_service_entities.dart';

class BookingEntities extends Equatable{

  final String shopName;
  final String address;
  final double rating;
  final DateTime? scheduleStartTime;
  final String largeImageUrl;
  final String smallImageUrl;
  final String status;
  final List<BookingServiceEntities> services;
  final double? distanceKm;

  const BookingEntities({
    this.shopName = '',
    this.address = '',
    this.rating = 0,
    this.scheduleStartTime,
    this.largeImageUrl = '',
    this.smallImageUrl = '',
    this.status = '',
    this.services = const [],
    this.distanceKm,
  });




  @override
  // TODO: implement props
  List<Object?> get props => [
    shopName,
    address,
    rating,
    scheduleStartTime,
    largeImageUrl,
    smallImageUrl,
    status,
    services,
    distanceKm,
  ];

  @override
  String toString() {
    return 'BookingEntities{shopName: $shopName, address: $address, rating: $rating, scheduleStartTime: $scheduleStartTime, largeImageUrl: $largeImageUrl, smallImageUrl: $smallImageUrl, status: $status, services: $services, distanceKm: $distanceKm}';
  }
}