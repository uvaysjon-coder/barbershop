import 'failures.dart';

class ServerException implements Exception {
  final String errorMessage;
  final num statusCode;
  const ServerException({required this.statusCode, required this.errorMessage});

  @override
  String toString() {
    return 'ServerException(statusCode: $statusCode, errorMessage: $errorMessage)';
  }
}

class DioCustomException implements Exception {}

class ParsingException implements Exception {
  final String errorMessage;
  const ParsingException({required this.errorMessage});
}
class TimeoutFailure extends Failure {}

class ErrorCoolDown extends Failure{
  final String message;
  final RemainingTime remainingTime;

  ErrorCoolDown({required this.message, required this.remainingTime});

}

class RemainingTime{
  final int minutes;
 final  int seconds;

  RemainingTime({required this.minutes, required this.seconds});
}

