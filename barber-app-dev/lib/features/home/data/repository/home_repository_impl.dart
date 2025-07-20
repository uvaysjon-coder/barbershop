import 'package:barbershop/core/data/model/base_model.dart';
import 'package:barbershop/core/data/model/home_response_model.dart';
import 'package:barbershop/core/entities/home_response_entities.dart';
import 'package:barbershop/core/exceptions/failures.dart';
import 'package:barbershop/core/utils/either.dart';
import 'package:barbershop/features/home/data/service/api_service.dart';
import 'package:barbershop/features/home/domain/repository/home_repository.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeService homeService;

  HomeRepositoryImpl(this.homeService);

  @override
  Future<Either<Failure, HomeResponseEntities>> getHome(
    homeQueryEntities,
  ) async {
    try {
      final response = await homeService.getHome(homeQueryEntities);

      final result = BaseModel.fromJson(response.data);

      if (result.isSuccess != null && result.isSuccess == true) {
        final data = HomeResponseModel.fromJson(result.data);

        return Right(data);
      } else {
        return Left(UserFailure(errorMessage: result.message.toString()));
      }
    } on DioException catch (e) {
      return Left(DioFailure(errorMessage: e.message.toString()));
    } catch (e) {
      return Left(DioFailure(errorMessage: e.toString()));
    }
  }
}
