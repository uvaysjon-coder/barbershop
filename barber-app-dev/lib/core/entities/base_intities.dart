import 'package:equatable/equatable.dart';

class BaseEntities extends Equatable {
  final int? statusCode;
  final String? message;
  final bool? isSuccess;
  final dynamic data;

  const BaseEntities({
    this.statusCode,
    this.message,
    this.isSuccess,
    this.data,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode, message, isSuccess, data];
}
