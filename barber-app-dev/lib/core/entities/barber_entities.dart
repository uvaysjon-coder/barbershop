import 'package:equatable/equatable.dart';

/*
"id": 6,
"name": "Somsaxona Barber",
"barberType": "Barber",
"largeImageUrl": "/2024/Images/ShopImages/1b451e01-ec9f-49de-b827-109d785227a6_Somsaxona Barber_large_1000_F_205498258_AfQmtyR5kO5llwKd6fWRRxcc4xRUbQcb.jpg",
"smallImageUrl": "/2024/Images/ShopImages/b541bb60-5286-4d4e-977a-1f2f7ca54295_Somsaxona Barber_small_1000_F_205498258_AfQmtyR5kO5llwKd6fWRRxcc4xRUbQcb.jpg",
"longitude": 41.58,
"latitude": 31.697,
"address": "Yunusobod",
"phoneNumber": "+998903455654",
"distance": 5612.25171416604,
"status": "closed",
"rating": null
*/


class BarberEntities extends Equatable {
  final String id, name, address, phoneNumber;
  final String? barberType, largeImg, smallImg, distance, status;
  final String? lat;
  final String? long;
  final double? rating;

  const BarberEntities({
    this.id = '',
    this.name = '',
    this.address = '',
    this.phoneNumber = '',
    this.barberType,
    this.largeImg,
    this.smallImg,
    this.distance,
    this.status,
    this.lat,
    this.long,
    this.rating,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    address,
    phoneNumber,
    barberType,
    largeImg,
    smallImg,
    distance,
    status,
    lat,
    long,
    rating
  ];
}
