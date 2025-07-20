/*
{
"id": 1,
"name": "Hair_coloring",
"price": "10000",
"description": "azscsad asjxcksajxksa lasnxjsanxj",
"serviceImageUrl": "/2024/Images/ServiceImages/3c12c875-8ba3-432f-86e7-9e22ee0ab2e8_Hair_coloring_512x512.png"
},*/

import 'package:equatable/equatable.dart';

class HaircutStylesEntities extends Equatable {
  final int id;
  final String name;
  final String price;
  final String? description;
  final String serviceImageUrl;

  const HaircutStylesEntities({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    required this.serviceImageUrl,
  });

  @override
  List<Object?> get props => [id, name, price, description, serviceImageUrl];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HaircutStylesEntities &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.description == description &&
        other.serviceImageUrl == serviceImageUrl;
  }
}
