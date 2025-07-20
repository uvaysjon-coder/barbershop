import 'package:barbershop/core/data/local/user_storage.dart';
import 'package:barbershop/core/data/model/user_model.dart';
import 'package:barbershop/core/entities/user_entities.dart';
import 'package:barbershop/features/auth/register/domain/entities/register_entities.dart';
import 'package:barbershop/features/auth/register/domain/repository/register_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/exceptions/failures.dart';
import '../../../../../core/utils/app_validation.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState.initial()) {
    final RegisterRepository res = sl<RegisterRepository>();
    final UserStorage userStorage = sl<UserStorage>();

    on<LoginPageEvent>((event, emit) {
      emit(state.copyWith(eventRegisterState: EventRegisterState.login));
      // TODO: implement event handler
    });
    on<RegisterInitialEvent>((event, emit) {
      emit(state.copyWith(
          loading: false, eventRegisterState: EventRegisterState.register));
    });
    on<EmailChangedEvent>((event, emit) {
      emit(state.copyWith(
        email: event.email,
      ));
    });
    on<NameChangedEvent>((event, emit) {
      emit(state.copyWith(
        name: event.name,
      ));
    });
    on<PhoneChangedEvent>((event, emit) {
      emit(state.copyWith(
        phone: event.phone.replaceAll(" ", ""),
      ));
    });
    on<PasswordChangedEvent>((event, emit) {
      emit(state.copyWith(
        password: event.password,
      ));
    });
    on<PasswordConfirmChangedEvent>((event, emit) {
      emit(state.copyWith(
        passwordConfirm: event.passwordConfirm,
      ));
    });

    on<SubmitRegisterEvent>((event, emit) async {
      if (state.loading) return;
      final isEmailValid = AppValidation.emailValidate(state.email);
      final isPhoneValid = AppValidation.mobileNumberUzbValidate(state.phone);
      final isPasswordValid = AppValidation.passwordValidate(state.password);
      final isPasswordConfirmValid = state.password == state.passwordConfirm;
      if (!isEmailValid ||
          state.name.isEmpty ||
          !isPhoneValid ||
          !isPasswordValid ||
          !isPasswordConfirmValid) {
        emit(state.copyWith(
          emailError: !isEmailValid,
          nameError: !state.name.isNotEmpty,
          phoneError: !isPhoneValid,
          passwordError: !isPasswordValid || !isPasswordConfirmValid,
          loading: false,
        ));
        return;
      }
      emit(state.copyWith(loading: true));
      final data = RegisterEntity(
        email: state.email,
        name: state.name,
        number: '+998${state.phone}',
        password: state.password,
        role: 1,
      );

      final result = await res.register(request: data);

      result.either((error){
        if(error is UserFailure){
          emit(state.copyWith(
            loading: false,
            errorMessage: error.errorMessage,
          ));
        }else if(error is DioFailure){
          emit(state.copyWith(
            loading: false,
            errorMessage: error.errorMessage,
          ));
        }
      }, (data){

        final UserEntities user = UserModel.fromJson(data.data);

        userStorage.putUser(user);

        emit(state.copyWith(
          loading: false,
          eventRegisterState: EventRegisterState.otp,
          statusMessage: data.message,
          userId: user.id.toString(),

        ));

      });
    });
  }
}
