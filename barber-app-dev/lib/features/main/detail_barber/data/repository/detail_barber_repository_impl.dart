import 'package:barbershop/core/data/model/base_model.dart';
import 'package:barbershop/core/entities/base_intities.dart';
import 'package:barbershop/core/exceptions/failures.dart';

import 'package:barbershop/core/utils/either.dart';
import 'package:barbershop/features/main/detail_barber/data/model/detail_barber_model.dart';

import 'package:barbershop/features/main/detail_barber/domain/entities/detail_barber_entities.dart';
import 'package:barbershop/features/main/detail_barber/domain/entities/schedule_entities.dart';
import 'package:dio/dio.dart';

import '../../../../../core/utils/print.dart';
import '../../domain/repository/detail_barber_repository.dart';
import '../datasources/barber_service.dart';
import '../model/schedule_model.dart';

class DetailBarberRepositoryImpl implements DetailBarberRepository {
  final BarberService barberService;

  DetailBarberRepositoryImpl(this.barberService);

  @override
  Future<Either<Failure, DetailBarberEntities>> getDetailBarber(
      String id) async {
    try {
      final response = await barberService.getDetailBarber(id);
      final data = BaseModel.fromJson(response.data);

      if (data.isSuccess != null && data.isSuccess == true) {
        return Right(DetailBarberModel.fromJson(data.data));
      } else {
        return Left(UserFailure(errorMessage: data.message.toString()));
      }
    } catch (e,s) {
      pPrint('DetailBarberRepositoryImpl Error $e , $s');
      return Left(UserFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ScheduleEntities>>> getScheduleBarber(String id,DateTime date) async {

    try{
      

      //"2025-04-28T00:00:00Z"
      final dateString = "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}T00:00:00Z";
      final response = await barberService.getSchedules(id,dateString);

      final data = BaseModel.fromJson(response.data);

      if (data.isSuccess != null && data.isSuccess == true ) {
        final list = data.data as List;
        if(list.isEmpty){
          return Right([]);
        }
        final result = list.map((e) => ScheduleModel.fromJson(e)).toList();
        return Right(result);
      } else {
        pPrint("DetailBarberRepositoryImpl Error ${data.statusCode} ${data.message.toString()} , ${data.data}");
        return Left(UserFailure(errorMessage: data.message.toString()));
      }

    }catch(e){

      pPrint('DetailBarberRepositoryImpl Error $e');
      return Left(UserFailure(errorMessage: e.toString()));
    }



  }

  @override
  Future<Either<Failure, BaseEntities>> bookingBarber(String barberId, String userId, List<String> serviceId, DateTime date) async {

    try {
      final response = await barberService.bookingBarber(
          barberId, userId, serviceId, date);

      final data = BaseModel.fromJson(response.data);

      if (data.isSuccess != null && data.isSuccess == true) {
        return Right(data);
      } else {
        pPrint(
            "DetailBarberRepositoryImpl Error ${data.statusCode} ${data.message
                .toString()} , ${data.data}");
        return Left(UserFailure(errorMessage: data.message.toString()));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        final data = BaseModel.fromJson(e.response?.data);
        pPrint(
            "DetailBarberRepositoryImpl Error ${data.statusCode} ${data.message
                .toString()} , ${data.data}");
        return Left(UserFailure(errorMessage: data.message.toString()));
      } else {
        pPrint('DetailBarberRepositoryImpl Error $e');
        return Left(UserFailure(errorMessage: e.toString()));
      }


    }catch (e,s){



      pPrint('DetailBarberRepositoryImpl Error $e , $s');
      return Left(UserFailure(errorMessage: e.toString()));
    }



    // TODO: implement bookingBarber
    throw UnimplementedError();
  }
}
