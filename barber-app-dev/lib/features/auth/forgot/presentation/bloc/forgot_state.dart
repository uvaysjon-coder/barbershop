part of 'forgot_bloc.dart';

class ForgotState extends Equatable {
  final String email;
  final String? errorMessage, userId;
  final bool loading;
  final bool isButtonEnabled;

  final EventForgotState? eventForgotState;

  const ForgotState({
    this.userId,
    this.errorMessage,
    this.isButtonEnabled = false,
     this.email = '',
     this.loading =false,
    this.eventForgotState,
  });

  factory ForgotState.initial() {
    return const ForgotState(
      email: '',
      isButtonEnabled: false,
      loading: false,
      eventForgotState: null,
    );
  }

  ForgotState copyWith({
    String? email,
    bool? loading,
    EventForgotState? eventForgotState,
    bool? isButtonEnabled,
    String? errorMessage,
    String? userId,
  }) {
    return ForgotState(
      email: email ?? this.email,
      loading: loading ?? this.loading,
      eventForgotState: eventForgotState,
      isButtonEnabled: isButtonEnabled ?? this.isButtonEnabled,
      errorMessage: errorMessage ,
      userId: userId ?? this.userId,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [email, loading, eventForgotState, isButtonEnabled];
}

enum EventForgotState {
  success,
}
