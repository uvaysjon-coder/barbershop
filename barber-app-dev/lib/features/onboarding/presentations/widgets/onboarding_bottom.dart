import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/core/themes/app_spacing.dart';
import 'package:barbershop/core/themes/app_theme.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:barbershop/features/onboarding/presentations/bloc/onboarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_indicator.dart';

class OnboardingBottom extends StatelessWidget {
  const OnboardingBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, OnboardingState>(
      builder: (context, state) {
        return Container(
          padding: AppSpacing.a20,
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.color.secondary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              12.gap,
              Text(
                state.model[state.currentIndex].title,
                style: context.textTheme.headlineSmall!.copyWith(
                  color: context.color.white,
                ),
              ),
              12.gap,
              Text(
                state.model[state.currentIndex].description,
                style: context.textTheme.labelLarge!.copyWith(
                  color: context.color.white,
                ),
              ),
              8.gap,
              Center(
                child: AnimatedCustomIndicator(
                  count: state.model.length,
                  currentIndex: state.currentIndex,
                ),
              ),
              12.gap,
              CustomButton.primary(
                text: state.name,
                onPressed: () {

                  context.read<OnboardingCubit>().nextButton();

                },
              ),
            ],
          ),
        );
      },
    );
  }
}
