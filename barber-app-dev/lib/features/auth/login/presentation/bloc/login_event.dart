part of 'login_bloc.dart';


abstract final  class LoginEvent  extends Equatable{
  const LoginEvent();
}

final class RegisterPageEvent extends LoginEvent {
  const RegisterPageEvent();
  @override
  List<Object> get props => [];
}

final class LoginInitialEvent extends LoginEvent {
  const LoginInitialEvent();
  @override
  List<Object> get props => [];
}

final class ForgotPasswordEvent extends LoginEvent {
  const ForgotPasswordEvent();
  @override
  List<Object> get props => [];
}

final class SubmitLoginEvent extends LoginEvent {

  const SubmitLoginEvent();

  @override
  List<Object> get props => [];
}
final class EmailChangedEvent extends LoginEvent {
  final String email;

  const EmailChangedEvent(this.email);

  @override
  List<Object> get props => [email];
}

final class PasswordChangedEvent extends LoginEvent {
  final String password;

  const PasswordChangedEvent(this.password);

  @override
  List<Object> get props => [password];
}