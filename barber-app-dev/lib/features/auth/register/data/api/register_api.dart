import 'package:barbershop/core/constants/urls.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/features/auth/register/data/model/register_model.dart';
import 'package:barbershop/features/auth/register/domain/entities/register_entities.dart';
import 'package:dio/dio.dart';

abstract class RegisterApi {
  Future<Response> register({required RegisterEntity request});
}

class RegisterApiImpl implements RegisterApi {
  final Dio _dio;

  RegisterApiImpl(this._dio);

  @override
  Future<Response> register({required RegisterEntity request}) async {

    final model = RegisterModel(
      email: request.email,
      password: request.password,
      name: request.name,
      number: request.number,
      role: request.role,
    );

    final result = await _dio.post(
      AppUrls.userCreate,
      data: model.toJson(),
    );
    pPrint("RegisterApiImpl ${result.toString()}", 3);
    return result;
  }
}
