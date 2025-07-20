import 'package:barbershop/core/exceptions/failures.dart';
import 'package:barbershop/core/utils/app_validation.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/data/local/user_storage.dart';
import '../../../../../core/data/model/user_model.dart';
import '../../../../../core/di/di.dart';
import '../../domain/repository/forgot_repository.dart';

part 'forgot_event.dart';
part 'forgot_state.dart';

class ForgotBloc extends Bloc<ForgotEvent, ForgotState> {
  ForgotBloc() : super(ForgotState.initial()) {
    final repository = sl<ForgotRepository>();
    final userStorage = sl<UserStorage>();

    on<ChangeEmail>((event, emit) {
      final isValid = AppValidation.emailValidate(event.email);

      emit(state.copyWith(email: event.email, isButtonEnabled: isValid));
    });

    on<SubmitForgot>((event, emit) async {
      emit(state.copyWith(loading: true));

      final result = await repository.forgotPassword(state.email);

      result.either((l) {
        if (l is UserFailure) {
          emit(state.copyWith(loading: false, errorMessage: l.errorMessage));
        } else if (l is ParsingFailure) {
          emit(state.copyWith(loading: false, errorMessage: l.toString()));
        } else {
          emit(state.copyWith(loading: false, errorMessage: l.toString()));
        }
      }, (r) {

        final user = UserModel.fromJson(r.data);

        userStorage.putUser(user);

        emit(state.copyWith(
            loading: false, eventForgotState: EventForgotState.success, userId: r.data['id'].toString()));
      });
      /*_repository.forgotPassword(state.email).then((value) {
        value.either((l) {
          emit(state.copyWith(
              loading: false, ));
        }, (r) {
          emit(state.copyWith(
              loading: false, eventForgotState: EventForgotState.success));
        });
      });*/
    });
  }
}
