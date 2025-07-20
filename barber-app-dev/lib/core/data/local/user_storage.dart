import 'dart:convert';

import 'package:barbershop/core/data/model/user_model.dart';
import 'package:barbershop/core/entities/user_entities.dart';
import 'package:barbershop/core/utils/print.dart';

import 'base_storage.dart';

final class UserStorage {
  static const String _user = 'user';

  final BaseStorage _baseStorage;

  UserStorage(this._baseStorage);

  Future<void> putUser(UserEntities user) async {
    // Convert UserEntities to JSON string
    final userModel = UserModel(
      name: user.name,
      email: user.email,
      password: user.password,
      phoneNumber: user.phoneNumber,
      role: user.role,
      isUserVerified: user.isUserVerified,
      id: user.id,
      isDeleted: user.isDeleted,
      createdDate: user.createdDate,
      profileImgUrl: user.profileImgUrl,
      modifiedDate: user.modifiedDate,
      deletedDate: user.deletedDate,
      lastInviteProgrammUser: user.lastInviteProgrammUser,
    );

    await _baseStorage.putString(key: _user, value: jsonEncode(userModel.toJson()) );
  }

  UserEntities? getUser() {

    // Get the JSON string from storage
    final String userJson = _baseStorage.getString(key: _user);
    if (userJson.isEmpty) {
      return null; // or return a default UserEntities object
    }
    // Convert the JSON string back to a UserEntities object
    pPrint(userJson,1);
    final Map<String, dynamic> userMap = jsonDecode(userJson);
    return UserModel.fromJson(userMap);
  }

  Future<void> removeUser() async {
    await _baseStorage.remove(key: _user);
  }
  bool isUserLoggedIn() {
    return _baseStorage.getString(key: _user).isNotEmpty;
  }
  Future<void> clearUser() async {
    await _baseStorage.remove(key: _user);
  }
}
