/*

import 'package:aros_staff/core/exceptions/error_status.dart';
import 'package:dio/dio.dart';

import '../utils/either.dart';
import '../utils/print.dart';
import 'exceptions.dart';
import 'failures.dart';

String extractErrorMessage(dynamic data) {
  if (data is Map && data.values.isNotEmpty) {
    return data.values.first.toString();
  }
  return data?.toString() ?? 'Unknown error';
}


void handleDioException(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.connectionError:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.connectionError:
    case DioExceptionType.sendTimeout:
      throw TimeOut();
    default:
      throw ParsingException(errorMessage: "Parsing error");
  }
}

class ApiResponse<T> {
  final T data;
  final int? statusCode;

  ApiResponse({required this.data, this.statusCode});
}

class RepositoryHelper {
  static Future<Either<Failure, T>> handleApiCall<T>({
    required Future<Response<dynamic>> Function() apiCall,
  }) async {
    try {
      final result = await apiCall();

      pPrint(" RepoNew =>${result.toString()}", level:4);
      if (result.statusCode != null &&
          result.statusCode! >= 200 &&
          result.statusCode! < 300) {
        return Right(result.data);
      }

      return Left(FailureStatus(

          errorStatus: ErrorStatus.serverError

      ));

    } on DioException catch (e) {
      switch (e.type) {

        case DioExceptionType.connectionTimeout:
          return Left(FailureStatus(
            errorStatus: ErrorStatus.timeOut
          ));
        case DioExceptionType.connectionError:
          return Left(FailureStatus(
              errorStatus: ErrorStatus.timeOut
          ));
        case DioExceptionType.sendTimeout:
          return Left(FailureStatus(
              errorStatus: ErrorStatus.timeOut
          ));

        case DioExceptionType.receiveTimeout:
          return Left(FailureStatus(
              errorStatus: ErrorStatus.timeOut
          ));
        default:
          return Left(FailureStatus(
              errorStatus: ErrorStatus.initial
          ));
      }
    } catch (e) {
      return Left(FailureStatus(
          errorStatus: ErrorStatus.unknown
      ));
    }
  }
}*/
