
import 'package:barbershop/core/data/model/base_model.dart';
import 'package:barbershop/core/data/model/booking_model.dart';
import 'package:barbershop/core/entities/booking_entities.dart';

import 'package:barbershop/core/exceptions/failures.dart';

import 'package:barbershop/core/utils/either.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:dio/dio.dart';

import '../../domain/repository/booking_repository.dart';
import '../datasource/booking_service.dart';

class BookingRepositoryImpl implements BookingRepository{

  final BookingService _service;

  BookingRepositoryImpl(this._service);

  @override
  Future<Either<Failure, List<BookingEntities>>> getAllBooking(String userID) async{

    try {
      final result = await _service.getAllBooking(barberId: userID);

      final data = BaseModel.fromJson(result.data);

      if(data.isSuccess != null && data.isSuccess!){
        final List<BookingEntities> list = [];

        if(data.data != null && data.data is List){
          for (var element in data.data) {
            final booking = BookingModel.fromJson(element);
            list.add(booking);
          }
        }

        return Right(list);
      }

      pPrint("error ${data.message}");
      if(data.message != null && data.message!.isNotEmpty){
        return Left(UserFailure(errorMessage: data.message!));
      }
      return Left(UserFailure(errorMessage: data.message ?? "Error"));






    } on DioException catch (e,s){
      return Left(DioFailure(errorMessage:  s.toString()));

    }catch (e,s){
      pPrint("error $e stack $s");
      return Left(UserFailure(errorMessage: s.toString()));
    }


    // TODO: implement getAllBooking
    throw UnimplementedError();
  }
}