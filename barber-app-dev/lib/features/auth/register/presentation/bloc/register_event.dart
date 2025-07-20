part of 'register_bloc.dart';

sealed  class RegisterEvent  extends Equatable {
  const RegisterEvent();
}



final class RegisterInitialEvent extends RegisterEvent {
   const RegisterInitialEvent();
  @override
  List<Object> get props => [];
}

final class SubmitRegisterEvent extends RegisterEvent {
  const SubmitRegisterEvent();
  @override
  List<Object> get props => [];
}

final class EmailChangedEvent extends RegisterEvent {
  final String email;

  const EmailChangedEvent(this.email);

  @override
  List<Object> get props => [email];
}

final class NameChangedEvent extends RegisterEvent {
  final String name;

  const NameChangedEvent(this.name);

  @override
  List<Object> get props => [name];
}

final class PhoneChangedEvent extends RegisterEvent {
  final String phone;

  const PhoneChangedEvent(this.phone);

  @override
  List<Object> get props => [phone];
}

final class PasswordChangedEvent extends RegisterEvent {
  final String password;

  const PasswordChangedEvent(this.password);

  @override
  List<Object> get props => [password];
}

final class PasswordConfirmChangedEvent extends RegisterEvent {
  final String passwordConfirm;

  const PasswordConfirmChangedEvent(this.passwordConfirm);

  @override
  List<Object> get props => [passwordConfirm];
}

final class LoginPageEvent extends RegisterEvent {
  const LoginPageEvent();
  @override
  List<Object> get props => [];
}




