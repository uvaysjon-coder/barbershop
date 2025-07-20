import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/core/gen/assets.gen.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/features/splash/presentation/bloc/splash_cubit.dart';
import 'package:barbershop/features/splash/presentation/widgets/splash_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../auth/login/presentation/login_page.dart';
import '../../dashboard/presentations/dashboard_page.dart';
import '../../onboarding/presentations/onboarding_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(
      const Duration(seconds: 2),
    ).then(
      (_) {
        context.mounted? context.read<SplashCubit>().init() : null;
      },
    );

    return Scaffold(
      backgroundColor: context.color.primary,
      body: BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
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
          // TODO: implement listener
        },
        child: SplashListener(
          child: Center(
            child: SvgPicture.asset(
              Assets.icon.appIcon.path,
              width: context.width * 0.3,
            ),
          ),
        ),
      ),

    );
  }
}
