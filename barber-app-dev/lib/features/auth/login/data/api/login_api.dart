
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/features/auth/login/domain/entities/login_entities.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constants/urls.dart';
import '../model/login_model.dart';

abstract  class LoginApi {
  Future<Response> login({required LoginEntity request});
}

class LoginApiImpl implements LoginApi {
  final Dio _dio;

  LoginApiImpl(this._dio);

  @override
  Future<Response> login({required LoginEntity request}) async {

    final model = LoginModel(
      email: request.email,
      password: request.password,
    );

    final result = await _dio.post(
      AppUrls.userLogin,
      data:model.toJson(),
    );
    pPrint("LoginApiImpl ${result.toString()}");
    return result;
  }
}