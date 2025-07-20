

import 'package:barbershop/features/auth/otp/domain/entities/otp_entities.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constants/urls.dart';
import '../../../../../core/utils/print.dart';
import '../model/otp_model.dart';

abstract class OtpApi {
  Future<Response> otp({required OtpEntities request});
}

class OtpApiImpl implements OtpApi {
  final Dio _dio;

  OtpApiImpl(this._dio);

  @override
  Future<Response> otp({required OtpEntities request}) async {

    final model = OtpModel(
     isRegistration: request.isRegistration,
      otpCode: request.otpCode,
      userId: request.userId,
    );

    final result = await _dio.post(
      AppUrls.userOtp,
      data: model.toJson(),
    );
    pPrint("OtpApiImpl ${result.toString()}", 3);
    return result;
  }
}