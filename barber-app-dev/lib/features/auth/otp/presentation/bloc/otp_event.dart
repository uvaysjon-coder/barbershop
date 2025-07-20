part of 'otp_bloc.dart';

abstract final  class OtpEvent extends Equatable{
  const OtpEvent();
}


final class OtpChangeEvent extends OtpEvent {
  final String otp;

  const OtpChangeEvent(this.otp);

  @override
  List<Object> get props => [otp];
}

final class OtpSubmitEvent extends OtpEvent {
  const OtpSubmitEvent();

  @override
  List<Object> get props => [];
}

final class OtpResendEvent extends OtpEvent {
  const OtpResendEvent();

  @override
  List<Object> get props => [];
}

final class RegisterOtpEvent extends OtpEvent {
  final String userId;
  const RegisterOtpEvent(this.userId);

  @override
  List<Object> get props => [userId];
}
final class LoginOtpEvent extends OtpEvent{
  final String userId;
  const LoginOtpEvent(this.userId);

  @override
  // TODO: implement props
  List<Object?> get props => [userId];
}

final class ForgotOtpEvent extends OtpEvent{
  final String userId;
  const ForgotOtpEvent(this.userId);

  @override
  // TODO: implement props
  List<Object?> get props => [userId];
}

