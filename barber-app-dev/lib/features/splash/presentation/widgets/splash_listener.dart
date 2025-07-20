import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/features/onboarding/presentations/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/login/presentation/login_page.dart';
import '../../../dashboard/presentations/dashboard_page.dart';
import '../bloc/splash_cubit.dart';

class SplashListener extends StatelessWidget {
  final Widget child;

  const SplashListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      
      listener: (_, state) {
        pPrint("SplashListener $state");
        switch (state.event) {
          case EventSplash.onBoarding:
            context.pushAndRemoveUntilWithSlide(
              predicate: (p0) => false,
              page: const OnboardingPage(),
            );
            break;
          case EventSplash.login:
            context.pushAndRemoveUntilWithSlide(
              predicate: (p0) => false,
              page: const LoginPage(),
            );
            break;
          case EventSplash.main:
            context.pushAndRemoveUntilWithSlide(
              predicate: (p0) => false,

              page: const DashboardPage(),
            );
            break;
        }
      },
      child: child,
    );
  }
}
