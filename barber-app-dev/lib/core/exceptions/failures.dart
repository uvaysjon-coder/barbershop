import 'package:equatable/equatable.dart';

import 'error_status.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class UserFailure extends Failure {
  final String errorMessage;

  UserFailure({required this.errorMessage});
}
class ServerFailure extends Failure {
  final num statusCode;
  final String errorMessage;

  ServerFailure({required this.errorMessage, required this.statusCode});
}

class FailureStatus extends Failure {
  final ErrorStatus errorStatus;

  FailureStatus({required this.errorStatus});
}

class DioFailure extends Failure {
  final String errorMessage;

  DioFailure({required this.errorMessage});
}

class ParsingFailure extends Failure {
  final String errorMessage;

  ParsingFailure({required this.errorMessage});
}

class CacheFailure extends Failure {}

class BadRequestFailure extends Failure {
  final String errorMessage;

  BadRequestFailure({required this.errorMessage});
}

class TimeOut extends Failure {}
