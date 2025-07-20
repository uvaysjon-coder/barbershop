import 'package:barbershop/features/auth/register/domain/entities/register_entities.dart';

class RegisterModel extends RegisterEntity {
  RegisterModel(
      {required super.email,
      required super.password,
      required super.name,
      required super.number,
      required super.role});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      email: json['email'],
      password: json['password'],
      name: json['name'],
      number: json['number'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'phoneNumber': number,
      'role': role,
    };
  }
}
