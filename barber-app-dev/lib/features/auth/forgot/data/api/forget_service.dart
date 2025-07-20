
import 'package:dio/dio.dart';

import '../../../../../core/constants/urls.dart';

abstract class ForgotService {
  Future<Response> forgotPassword(String email);
}


class ForgetServiceImpl implements ForgotService {
  final Dio _dio;

  ForgetServiceImpl(this._dio);

  @override
  Future<Response> forgotPassword(String email) async {
    return  await _dio.post(
      AppUrls.userForgot,
      data: {
        'email': email,
      },
    );
  }
}