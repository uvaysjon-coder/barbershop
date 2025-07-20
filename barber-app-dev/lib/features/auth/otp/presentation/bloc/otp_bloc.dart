import 'package:barbershop/core/data/local/token_storage.dart';
import 'package:barbershop/features/auth/otp/domain/repository/otp_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/di/di.dart';
import '../../../../../core/exceptions/failures.dart';
import '../../domain/entities/otp_entities.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc() : super(OtpState.initial()) {
    final OtpRepository repository = sl<OtpRepository>();
    final TokenStorage tokenStorage = sl<TokenStorage>();
    on<OtpChangeEvent>((event, emit) {
      emit(state.copyWith(otp: event.otp, otpError: false, errorMessage: ''));
      if (state.otp.length == 4) {
        add(const OtpSubmitEvent());
      }
      // TODO: implement event handler
    });

    on<OtpSubmitEvent>((event, emit) async {
      emit(state.copyWith(loading: true));

      final model = OtpEntities(
          userId: state.userId,
          otpCode: state.otp,
          isRegistration: state.isRegister);

      final result = await repository.otp(request: model);

      result.either(
        (error) {
          if (error is UserFailure) {
            emit(state.copyWith(
                loading: false,
                otpError: true,
                errorMessage: error.errorMessage));
          }
          else if (error is DioFailure) {
            emit(state.copyWith(
                loading: false,
                otpError: true,
                errorMessage: error.errorMessage));
          }
        },
        (data) {
          tokenStorage.putToken(data.data['token']);
          emit(state.copyWith(loading: false, eventOtp: EventOtp.success));
        },
      );

      /*    await Future.delayed(const Duration(seconds: 2));

      if (state.otp == '7788') {
        emit(state.copyWith(loading: false, eventOtp: EventOtp.success,otpError: false,
            errorMessage: null));
        return;
      }
      emit(state.copyWith(
          loading: false,
          otpError: true,
          errorMessage: 'Invalid OTP'
      ));*/
    });

    on<OtpResendEvent>((event, emit) {});

    on<RegisterOtpEvent>((event, emit) {
      emit(state.copyWith(isRegister: true, userId: event.userId));
    });

    on<LoginOtpEvent>((event, emit) {
      emit(state.copyWith(isRegister: false, userId: event.userId));
    });

    on<ForgotOtpEvent>((event, emit) {
      emit(state.copyWith(isRegister: false, userId: event.userId));
    });
  }
}
