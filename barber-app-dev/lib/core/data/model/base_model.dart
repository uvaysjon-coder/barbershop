import '../../entities/base_intities.dart';

class BaseModel extends BaseEntities {
  const BaseModel({
    super.statusCode,
    super.message,
    super.isSuccess,
    super.data,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) {
    return BaseModel(
      statusCode: json['statusCode'],
      message: json['message'],
      isSuccess: json['isSuccess'],
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'isSuccess': isSuccess,
      'data': data,
    };
  }
}
