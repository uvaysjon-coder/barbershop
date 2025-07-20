import 'dart:io';

import 'package:barbershop/core/data/model/base_model.dart';
import 'package:barbershop/core/entities/base_intities.dart';
import 'package:barbershop/core/exceptions/failures.dart';
import 'package:barbershop/core/exceptions/unknown_error.dart';
import 'package:barbershop/core/utils/either.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/features/profile/domain/profile_repository.dart';
import 'package:dio/dio.dart';

import '../datasourse/profile_service.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileService profileService;

  ProfileRepositoryImpl(this.profileService);

  @override
  Future<Either<Failure, BaseEntities>> userUpdate({
    required String userId,
    String? userName,
    String? password,
    String? phoneNumber,
    File? image,
  }) async {
    try {
      final result = await profileService.userUpdate(
          userId, userName, password, phoneNumber, image);
      final data = BaseModel.fromJson(result.data);
      if (data.statusCode == 200 && data.isSuccess == true) {
        return Right(data);
      } else {
        return Left(UserFailure(errorMessage: data.message.toString()));
      }
    } on DioException catch (e) {
      return Left(DioFailure(errorMessage: e.message.toString()));
    } catch (e,s) {
      pPrint("Error: $e $s");
      return Left(UnknownFailure(e.toString()));
    }
  }
}
