/*

"shopId": 1,
"userId": 1,
"name": "NEW Barber",
"description": "Cutting Hair",
"largeImageUrl": "/2024/Images/ShopImages/012f806d-0d79-49e8-b194-83be895a3a41_NEW Barber_large_barber-terms-hero-scaled-1.jpg",
"smallImageUrl": "/2024/Images/ShopImages/fca3bc7e-a9c9-4ce6-a792-f983568b3923_NEW Barber_small_barber-terms-hero-scaled-1.jpg",
"phoneNumber": "+998923456789",
"shopType": "Barber",
"rating": 0,
"ratedPeopleCount": 0,
"address": "Shayxontoxur",
"longitude": 45.98,
"latitude": 34.657,
"workingWeekDate": 4,
"startDate": "09:00:00",
"endDate": "19:00:00",
"haircutStyles": [
{
"id": 1,
"name": "Hair_coloring",
"price": "10000",
"description": "azscsad asjxcksajxksa lasnxjsanxj",
"serviceImageUrl": "/2024/Images/ServiceImages/3c12c875-8ba3-432f-86e7-9e22ee0ab2e8_Hair_coloring_512x512.png"
},
{
"id": 4,
"name": "Special_Massage",
"price": "23",
"description": "string",
"serviceImageUrl": "/2024/Images/ServiceImages/42105ede-db07-47b8-a5e1-4874a20eeda0_Special_Massage_barber-terms-hero-scaled-1.jpg"
}
]
}
*/

import 'package:barbershop/core/entities/barber_entities.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/features/main/detail_barber/domain/entities/haircut_styles_entities.dart';
import 'package:equatable/equatable.dart';

class DetailBarberEntities extends Equatable {
  final int shopId;
  final int userId;
  final String name;
  final String? description;
  final String largeImageUrl;
  final String smallImageUrl;
  final String phoneNumber;
  final String? shopType;
  final int? rating;
  final int ratedPeopleCount;
  final String address;
  final double longitude;
  final double latitude;
  final String workingWeekDate;
  final String startDate;
  final String endDate;
  final List<HaircutStylesEntities>? haircutStyles;

  const DetailBarberEntities({
    required this.shopId,
    required this.userId,
    required this.name,
    this.description,
    required this.largeImageUrl,
    required this.smallImageUrl,
    required this.phoneNumber,
    this.shopType,
    this.rating,
    required this.ratedPeopleCount,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.workingWeekDate,
    required this.startDate,
    required this.endDate,
    this.haircutStyles,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        shopId,
        userId,
        name,
        description,
        largeImageUrl,
        smallImageUrl,
        phoneNumber,
        shopType,
        rating,
        ratedPeopleCount,
        address,
        longitude,
        latitude,
        workingWeekDate,
        startDate,
        endDate,
        haircutStyles
      ];

  BarberEntities toBarberEntities() {
    try{
      return BarberEntities(
          id: userId.toString(),
          name: name,
          barberType: shopType,
          smallImg: smallImageUrl ,
          largeImg: largeImageUrl,
          phoneNumber: phoneNumber,
          address: address,
          distance: "",
          lat: latitude.toString(),
          long: longitude.toString(),
          rating:double.tryParse(rating.toString()) ??  0.0,
          status: shopType
      );

    }catch(e){
      pPrint('Error in DetailBarberEntities toBarberEntities: $e');
      return BarberEntities(
          id: userId.toString(),
          name: name,
          barberType: shopType,
          smallImg: smallImageUrl ,
          largeImg: largeImageUrl,
          phoneNumber: phoneNumber,
          address: address,
          distance: "",
          lat: latitude.toString(),
          long: longitude.toString(),
          rating: 0.0,
          status: shopType
      );
    }
  }
}
