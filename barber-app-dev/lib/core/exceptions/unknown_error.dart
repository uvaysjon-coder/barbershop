import 'failures.dart';

class UnknownFailure extends Failure {
  final String message;

  UnknownFailure([this.message = "An unknown error occurred"]);

  @override
  String toString() => message;
}
