
import 'package:barbershop/core/data/local/app_storage.dart';
import 'package:barbershop/core/data/local/token_storage.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/di/di.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  final AppStorage _appStorage = sl<AppStorage>();
  final TokenStorage _tokenStorage = sl<TokenStorage>();

  void init() async {

    final bool isOnBoarding = _appStorage.getOnBoarding();
    final String token = _tokenStorage.getToken();


    pPrint("isOnBoarding: $isOnBoarding token: $token");
    await Future.delayed(const Duration(seconds: 1));
   /* emit(SplashState.authenticated());
    return;*/
    if (isOnBoarding) {
      if (token.isNotEmpty) {
        pPrint("is onBoarding finish and token not empty");
        emit(state.copyWith(
          event: EventSplash.main
        ));
      } else {
        pPrint("is onBoarding finish and token empty");
        emit(state.copyWith(
          event: EventSplash.login
        ));
      }
    } else {
      pPrint("is onBoarding not finish");
      emit(state.copyWith(
        event: EventSplash.onBoarding
      ));
    }
    pPrint("is onBoarding finish ");

  }
}
