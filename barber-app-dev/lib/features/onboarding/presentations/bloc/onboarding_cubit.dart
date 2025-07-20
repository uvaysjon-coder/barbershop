import 'package:barbershop/core/gen/assets.gen.dart';
import 'package:barbershop/features/onboarding/domain/onboarding_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/data/local/app_storage.dart';
import '../../../../core/di/di.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState.initial());

  final AppStorage _appStorage = sl<AppStorage>();

/*  void nextPage() {
    if (state.currentIndex < state.model.length - 1) {
      emit(state.copyWith(currentIndex: state.currentIndex + 1, name: "Next"));
    } else {
      emit(state.copyWith(name: "Get Started"));
    }
  }

  void backPage() {
    if (state.currentIndex > 0) {
      emit(state.copyWith(currentIndex: state.currentIndex - 1, name: "Next"));
    }
  }*/

  void nextButton()  async {
    if (state.page==OnboardingEnum.onFinish) {
      await _appStorage.setOnBoarding();
      emit(state.copyWith(page: OnboardingEnum.finish));
      return;
    }
    if(state.currentIndex == state.model.length - 1){
      emit(state.copyWith(name: "Get Started",page: OnboardingEnum.onFinish));
    }  else {
      emit(state.copyWith(name: "Next",currentIndex: state.currentIndex + 1));
    }
  }

  void changeIndex(int index) {
    if (index == state.model.length - 1) {
      emit(state.copyWith(name: "Get Started",currentIndex: index,page: OnboardingEnum.onFinish));
    } else {
      emit(state.copyWith(name: "Next",currentIndex: index));
    }
  }
}
