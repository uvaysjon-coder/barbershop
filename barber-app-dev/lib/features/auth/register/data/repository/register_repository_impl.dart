

import 'package:barbershop/core/data/model/base_model.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/features/auth/register/domain/entities/register_entities.dart';
import 'package:barbershop/features/auth/register/domain/repository/register_repository.dart';
import 'package:dio/dio.dart';

import '../../../../../core/exceptions/failures.dart';
import '../../../../../core/utils/either.dart';
import '../api/register_api.dart';

class RegisterRepositoryImpl  extends RegisterRepository{

  final RegisterApi _registerApi;

  RegisterRepositoryImpl(this._registerApi);


  @override
  Future<Either<Failure,BaseModel>> register({required RegisterEntity request}) async{

    try {
      final result = await _registerApi.register(request: request);
      final data = BaseModel.fromJson(result.data);
      if(data.isSuccess !=null && data.isSuccess == true){
        return Right(data);

      }else{
        return Left(UserFailure(errorMessage: data.message.toString()));
      }
    } on DioException catch (e,s) {
      pPrint("RegisterRepositoryImpl $s", 4);
      pPrint("RegisterRepositoryImpl $e", 4);
      return Left(DioFailure(errorMessage:e.message.toString()));
    }
  }

}