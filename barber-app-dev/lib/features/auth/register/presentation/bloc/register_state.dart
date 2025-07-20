part of 'register_bloc.dart';

final class RegisterState extends Equatable {
  final String email, name, phone, passwordConfirm, password;
  final String? errorMessage,statusMessage,userId;

  final bool emailError, nameError, phoneError, passwordError, loading;
  final EventRegisterState eventRegisterState;

  const RegisterState({
    this.errorMessage,
    this.statusMessage,
    this.userId,
    required this.email,
    required this.password,
    required this.eventRegisterState,
    required this.name,
    required this.phone,
    required this.passwordConfirm,
    required this.emailError,
    required this.nameError,
    required this.phoneError,
    required this.passwordError,
    required this.loading});

  factory RegisterState.initial() {
    return const RegisterState(
        email: '',
        password: '',
        eventRegisterState: EventRegisterState.register,
        name: '',
        phone: '',
        passwordConfirm: '',
        emailError: false,
        nameError: false,
        phoneError: false,
        passwordError: false,
        loading: false);
  }

  copyWith({String? email,
    String? password,
    EventRegisterState? eventRegisterState,
    String? name,
    String? phone,
    String? passwordConfirm,
    bool? loading,
    bool? emailError,
    bool? nameError,
    bool? phoneError,
    bool? passwordError,
    String? errorMessage,
    String? userId,
    String? statusMessage

  }) {
    return RegisterState(
        email: email ?? this.email,
        password: password ?? this.password,
        eventRegisterState: eventRegisterState ?? EventRegisterState.register,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        passwordConfirm: passwordConfirm ?? this.passwordConfirm,
        loading: loading ?? false,
        emailError: emailError ?? false,
        nameError: nameError ?? false,
        phoneError: phoneError ?? false,
        passwordError: passwordError ?? false,
        errorMessage: errorMessage ,
        statusMessage: statusMessage,
        userId: userId??this.userId
    );

  }

  @override
  List<Object?> get props =>
      [
        email,
        password,
        eventRegisterState,
        name,
        phone,
        passwordConfirm,
        emailError,
        nameError,
        phoneError,
        passwordError,
        loading,
        errorMessage??'',
        statusMessage??'',
        userId??''
      ];
}

enum EventRegisterState { login, register, otp }
