import 'package:barbershop/core/data/model/user_model.dart';
import 'package:barbershop/core/entities/user_entities.dart';
import 'package:barbershop/features/auth/login/domain/entities/login_entities.dart';
import 'package:dio/dio.dart';

import '../../../../../core/data/model/base_model.dart';
import '../../../../../core/exceptions/failures.dart';
import '../../../../../core/utils/either.dart';
import '../../../../../core/utils/print.dart';
import '../../domain/repository/login_repository.dart';
import '../api/login_api.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginApi loginApi;

  LoginRepositoryImpl(this.loginApi);

  @override
  Future<Either<Failure, UserEntities>> login(
      {required LoginEntity request}) async {
    try {
      final result = await loginApi.login(request: request);

      final data = BaseModel.fromJson(result.data);
      if (data.isSuccess != null && data.isSuccess == true) {

        final user = UserModel.fromJson(data.data);

        return Right(user);
      } else {
        return Left(UserFailure(errorMessage: data.message.toString()));
      }
    } on DioException catch (e, s) {
      pPrint("RegisterRepositoryImpl $s", 4);
      pPrint("RegisterRepositoryImpl $e", 4);
      return Left(DioFailure(errorMessage: e.message.toString()));
    }catch(e,s){
      pPrint("RegisterRepositoryImpl $s", 4);
      pPrint("RegisterRepositoryImpl $e", 4);
      return Left(DioFailure(errorMessage: e.toString()));
    }
  }
}
