part of 'otp_bloc.dart';

final class OtpState extends Equatable {
  final String otp;
  final String? errorMessage;
  final bool loading, otpError;
  final EventOtp? eventOtp;
  final bool isRegister;
  final String userId;

  const OtpState({
    this.errorMessage,
    this.otp = '',
    this.loading = false,
    this.otpError = false,
    this.eventOtp,
    this.isRegister = false,
    this.userId = '',
  });

  factory OtpState.initial() {
    return const OtpState(
      errorMessage: null,
      otp: '',
      loading: false,
      otpError: false,
    );
  }

  OtpState copyWith({
    String? otp,
    String? errorMessage,
    bool? loading,
    bool? otpError,
    EventOtp? eventOtp,
    bool? isRegister,
    String? userId,
  }) {
    return OtpState(
      otp: otp ?? this.otp,
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      otpError: otpError ?? this.otpError,
      eventOtp: eventOtp,
      isRegister: isRegister ?? this.isRegister,
      userId: userId ?? this.userId,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [otp, errorMessage, loading, otpError, eventOtp, isRegister, userId];

  @override
  String toString() {
    return 'OtpState{otp: $otp, errorMessage: $errorMessage, loading: $loading, otpError: $otpError, eventOtp: $eventOtp, isRegister: $isRegister, userId: $userId}';
  }
}

enum EventOtp {
  success,
}
