import 'package:barbershop/features/auth/otp/domain/entities/otp_entities.dart';

class OtpModel extends OtpEntities {
  OtpModel({
      required super.userId,
      required super.otpCode,
      required super.isRegistration
  });

  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
      userId: json['userId'],
      otpCode: json['otpCode'],
      isRegistration: json['isRegistration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'otpCode': otpCode,
      'isRegistration': isRegistration,
    };
  }
}
