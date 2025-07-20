// home_response_model.dart
import 'package:barbershop/core/data/model/barber_model.dart';
import 'package:barbershop/core/entities/barber_entities.dart';
import 'package:barbershop/core/entities/home_response_entities.dart';

class HomeResponseModel extends HomeResponseEntities {
  const HomeResponseModel({
    required super.totalItems,
    required super.totalPages,
    required super.currentPage,
    required super.pageSize,
    required super.barbers,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    List<BarberEntities> barbersList = [];

    if (json['barbers'] != null && json['barbers'] is List) {
      barbersList = (json['barbers'] as List)
          .map((barberJson) => BarberModel.fromJson(barberJson))
          .toList();
    }

    return HomeResponseModel(
      totalItems: json['totalItems'] ?? 0,
      totalPages: json['totalPages'] ?? 0,
      currentPage: json['currentPage'] ?? 1,
      pageSize: json['pageSize'] ?? 0,
      barbers: barbersList,
    );
  }

  factory HomeResponseModel.fromEntity(HomeResponseEntities entity) {
    return HomeResponseModel(
      totalItems: entity.totalItems,
      totalPages: entity.totalPages,
      currentPage: entity.currentPage,
      pageSize: entity.pageSize,
      barbers: entity.barbers,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalItems': totalItems,
      'totalPages': totalPages,
      'currentPage': currentPage,
      'pageSize': pageSize,
      'barbers': barbers.map((barber) {
        if (barber is BarberModel) {
          return barber.toJson();
        } else {
          // Agar BarberModel emas, BarberEntities bo'lsa
          // uni BarberModel ga o'tkazib, so'ng toJson() qilish
          return BarberModel.fromEntity(barber).toJson();
        }
      }).toList(),
    };
  }
}
