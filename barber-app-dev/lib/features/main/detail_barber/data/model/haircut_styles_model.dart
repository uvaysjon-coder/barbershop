import 'package:barbershop/features/main/detail_barber/domain/entities/haircut_styles_entities.dart';

class HaircutStylesModel extends HaircutStylesEntities {
  const HaircutStylesModel({
    required super.id,
    required super.name,
    required super.price,
     super.description,
    required super.serviceImageUrl,
  });

  factory HaircutStylesModel.fromJson(Map<String, dynamic> json) {
    return HaircutStylesModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      serviceImageUrl: json['serviceImageUrl'],
    );
  }


}
