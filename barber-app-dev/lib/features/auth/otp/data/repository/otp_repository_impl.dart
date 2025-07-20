import 'package:barbershop/core/data/model/base_model.dart';
import 'package:barbershop/core/exceptions/failures.dart';
import 'package:barbershop/core/utils/either.dart';
import 'package:barbershop/features/auth/otp/domain/entities/otp_entities.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/print.dart';
import '../../domain/repository/otp_repository.dart';
import '../api/otp_api.dart';

class OtpRepositoryImpl extends OtpRepository {
  final OtpApi otpApi;

  OtpRepositoryImpl(this.otpApi);

  @override
  Future<Either<Failure, BaseModel>> otp({required OtpEntities request}) async {
    try {
      final result = await otpApi.otp(request: request);

      final data = BaseModel.fromJson(result.data);
      if (data.isSuccess != null && data.isSuccess == true) {
        return Right(data);
      } else {
        return Left(UserFailure(errorMessage: data.message.toString()));
      }
    } on DioException catch (e, s) {
      pPrint("RegisterRepositoryImpl $s", 4);
      pPrint("RegisterRepositoryImpl $e", 4);
      return Left(DioFailure(errorMessage: e.message.toString()));
    }
  }
}
