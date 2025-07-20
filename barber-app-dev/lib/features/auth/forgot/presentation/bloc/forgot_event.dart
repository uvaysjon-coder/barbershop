part of 'forgot_bloc.dart';

sealed class ForgotEvent extends Equatable {
  const ForgotEvent();
}

class ChangeEmail extends ForgotEvent {
  final String email;
  const ChangeEmail({required this.email});
  @override
  List<Object> get props => [email];
}

class SubmitForgot extends ForgotEvent {
  const SubmitForgot();
  @override
  List<Object> get props => [];
}
