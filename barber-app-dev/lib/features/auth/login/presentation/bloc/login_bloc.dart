import 'package:barbershop/core/data/local/user_storage.dart';
import 'package:barbershop/core/exceptions/failures.dart';
import 'package:barbershop/core/utils/app_validation.dart';
import 'package:barbershop/features/auth/login/domain/entities/login_entities.dart';
import 'package:barbershop/features/auth/login/domain/repository/login_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/di/di.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState.initial()) {
    final LoginRepository repository = sl<LoginRepository>();
    final UserStorage userStorage = sl<UserStorage>();


    on<RegisterPageEvent>((event, emit) {
      emit(state.copyWith(eventLoginState: EventLoginState.register));
      // TODO: implement event handler
    });
    on<LoginInitialEvent>((event, emit) {
      emit(state.copyWith(
          loading: false, eventLoginState: EventLoginState.login));
    });
    on<ForgotPasswordEvent>((event, emit) {
      emit(state.copyWith(eventLoginState: EventLoginState.forgotPassword));
    });

    on<SubmitLoginEvent>((event, emit) async {
      emit(state.copyWith(loading: true));


      final isEmailValid = AppValidation.emailValidate(state.email);
      final isPasswordValid = AppValidation.passwordValidate(state.password);

      if (!isEmailValid || !isPasswordValid) {
        emit(state.copyWith(
          emailError: !isEmailValid,
          passwordError: !isPasswordValid,
          loading: false,
        ));
        return;
      }
      final model = LoginEntity(email: state.email, password: state.password);

      final result = await repository.login(request: model);

      result.either(
        (error) {
          if(error is UserFailure){
            emit(state.copyWith(
              loading: false,
              emailError: true,
              passwordError: true,
              errorMessage: error.errorMessage,
            ));
          }
          else if(error is DioFailure){
            emit(state.copyWith(
              loading: false,
              errorMessage: error.errorMessage,
            ));
          }

        },
        (data) {

          userStorage.putUser(data);

          emit(state.copyWith(
            loading: false,
            statusMessage: "User login successfully",
            eventLoginState: EventLoginState.otp,
            userId: data.id.toString(),

          ));
        },
      );

    });

    on<EmailChangedEvent>((event, emit) {
      emit(state.copyWith(email: event.email, emailError: false));
    });
    on<PasswordChangedEvent>((event, emit) {
      emit(state.copyWith(password: event.password, passwordError: false));
    });
  }
}
