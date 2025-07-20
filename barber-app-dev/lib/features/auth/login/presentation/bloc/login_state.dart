part of 'login_bloc.dart';

final class LoginState extends Equatable {
  final String email;
  final String password;
  final EventLoginState eventLoginState;
  final bool loading;
  final bool emailError, passwordError;
  final String? userId, errorMessage, statusMessage;

  const LoginState({
    required this.loading,
    required this.emailError,
    required this.passwordError,
    required this.email,
    this.userId,
    this.errorMessage,
    this.statusMessage,
    required this.password,
    required this.eventLoginState,
  });

  factory LoginState.initial() {
    return const LoginState(
        email: '',
        password: '',
        eventLoginState: EventLoginState.login,
        loading: false,
        emailError: false,
        passwordError: false);
  }

  LoginState copyWith({
    String? email,
    String? password,
    EventLoginState? eventLoginState,
    bool? loading,
    bool? emailError,
    bool? passwordError,
    String? userId,
    String? errorMessage,
    String? statusMessage,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        eventLoginState: eventLoginState ?? EventLoginState.login,
        loading: loading ?? this.loading,
        emailError: emailError ?? this.emailError,
        errorMessage: errorMessage ,
        statusMessage: statusMessage ,
        userId: userId ?? this.userId,
        passwordError: passwordError ?? this.passwordError);
  }

  @override
  List<Object?> get props => [
        email,
        password,
        eventLoginState,
        loading,
        emailError,
        passwordError,
        userId,
        errorMessage,
        statusMessage,
      ];
}

enum EventLoginState {
  login,
  register,
  forgotPassword,
  otp,
}
