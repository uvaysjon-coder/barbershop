
import 'package:barbershop/core/entities/user_entities.dart';

class UserModel extends UserEntities {
  const UserModel({
    required super.name,
    required super.email,
    required super.password,
    required super.phoneNumber,
    required super.role,
    required super.isUserVerified,
    required super.id,
    required super.isDeleted,
    required super.createdDate,
    super.profileImgUrl,
    super.modifiedDate,
    super.deletedDate,
    super.lastInviteProgrammUser,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      password: json['password']?.toString() ?? '',
      phoneNumber: json['phoneNumber']?.toString() ?? '',
      role: json['role']?.toString() ?? '',
      isUserVerified: json['isUserVerified'] ?? false,
      id: json['id'] ?? 0,
      isDeleted: json['isDeleted'] ?? false,
      createdDate: json['createdDate']?.toString() ?? '',
      profileImgUrl: json['profileImgUrl'],
      modifiedDate: json['modifiedDate'],
      deletedDate: json['deletedDate'],
      lastInviteProgrammUser: json['lastInviteProgrammUser'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'role': role,
      'isUserVerified': isUserVerified,
      'id': id,
      'isDeleted': isDeleted,
      'createdDate': createdDate,
      'profileImgUrl': profileImgUrl,
      'modifiedDate': modifiedDate,
      'deletedDate': deletedDate,
      'lastInviteProgrammUser': lastInviteProgrammUser,
    };
  }
}
