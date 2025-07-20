import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/features/auth/login/presentation/login_page.dart';
import 'package:barbershop/features/onboarding/presentations/widgets/onboarding_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/onboarding_cubit.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        _pageController.animateToPage(state.currentIndex,
            duration: const Duration(milliseconds: 400), curve: Curves.easeIn);

        if (state.page == OnboardingEnum.finish) {

          context.pushAndRemoveUntilWithSlide(
            page: const LoginPage(),
            predicate: (p0) => false,
          );
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(
            //     builder: (_) => const LoginPage(),
            //     ),
            //
            // );
          }

      },
      child: Scaffold(
          body: Stack(
            alignment: Alignment.topCenter,
            fit: StackFit.expand,
            children: [
              PageView(

                onPageChanged: (index) {
                  context.read<OnboardingCubit>().changeIndex(index);
                },
                controller: _pageController,
                children: context
                    .watch<OnboardingCubit>()
                    .state
                    .model
                    .map((e) => Image.asset(e.image,fit: BoxFit.contain,))
                    .toList(),


              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: OnboardingBottom(),
              )
            ],
          )
      ),
    );
  }
}
