import 'package:barbershop/core/data/model/base_model.dart';
import 'package:barbershop/core/exceptions/failures.dart';
import 'package:barbershop/core/utils/either.dart';
import 'package:barbershop/features/auth/forgot/data/api/forget_service.dart';
import 'package:barbershop/features/auth/forgot/domain/repository/forgot_repository.dart';

class ForgotRepositoryImpl extends ForgotRepository {
  final ForgotService _api;

  ForgotRepositoryImpl(this._api);

  @override
  Future<Either<Failure, BaseModel>> forgotPassword(String email) async {
    try {
      final result = await _api.forgotPassword(email);
      final data = BaseModel.fromJson(result.data);
      if (data.isSuccess != null && data.isSuccess == true) {
        return Right(data);
      } else {
        return Left(UserFailure(errorMessage: data.message.toString()));
      }
    } catch (e) {
      return Left(ParsingFailure(errorMessage: e.toString()));
    }
  }
}
