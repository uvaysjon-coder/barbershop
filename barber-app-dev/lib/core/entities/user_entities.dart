/*
"name": "ikrombek",
"email": "ikpydev@gmail.com",
"password": "1234qwer",
"phoneNumber": "+998993451812",
"profileImgUrl": null,
"role": "User",
"isUserVerified": true,
"id": 2,
"isDeleted": false,
"createdDate": "2025-03-26T08:36:05.960272Z",
"modifiedDate": null,
"deletedDate": null,
"lastInviteProgrammUser": null*/

import 'package:equatable/equatable.dart';

class UserEntities extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String? profileImgUrl;
  final String role;
  final bool isUserVerified;
  final int id;
  final bool isDeleted;
  final String createdDate;
  final String? modifiedDate;
  final String? deletedDate;
  final String? lastInviteProgrammUser;

  const UserEntities({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    this.profileImgUrl,
    required this.role,
    required this.isUserVerified,
    required this.id,
    required this.isDeleted,
    required this.createdDate,
    this.modifiedDate,
    this.deletedDate,
    this.lastInviteProgrammUser,
  });


  @override
  String toString() {
    return 'UserEntities{name: $name, email: $email, password: $password, phoneNumber: $phoneNumber, profileImgUrl: $profileImgUrl, role: $role, isUserVerified: $isUserVerified, id: $id, isDeleted: $isDeleted, createdDate: $createdDate, modifiedDate: $modifiedDate, deletedDate: $deletedDate, lastInviteProgrammUser: $lastInviteProgrammUser}';
  }


  UserEntities copyWith({
    String? name,
    String? email,
    String? password,
    String? phoneNumber,
    String? profileImgUrl,
    String? role,
    bool? isUserVerified,
    int? id,
    bool? isDeleted,
    String? createdDate,
    String? modifiedDate,
    String? deletedDate,
    String? lastInviteProgrammUser,
  }) {
    return UserEntities(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImgUrl: profileImgUrl ?? this.profileImgUrl,
      role: role ?? this.role,
      isUserVerified: isUserVerified ?? this.isUserVerified,
      id: id ?? this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      deletedDate: deletedDate ?? this.deletedDate,
      lastInviteProgrammUser: lastInviteProgrammUser ?? this.lastInviteProgrammUser,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        email,
        password,
        phoneNumber,
        profileImgUrl,
        role,
        isUserVerified,
        id,
        isDeleted,
        createdDate,
        modifiedDate,
        deletedDate,
        lastInviteProgrammUser,
      ];
}
