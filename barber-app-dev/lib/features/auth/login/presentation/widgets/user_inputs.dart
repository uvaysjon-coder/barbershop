import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:barbershop/core/widgets/custom_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

class UserInputs extends StatelessWidget {
  const UserInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {


        return Container(
          padding: AppSpacing.a20,
          width: context.width,
          decoration: BoxDecoration(
            color: context.color.white, // Changed to white to match the image
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.gap,
              Row(
                children: [
                  Text(
                    "Welcome back ",
                    style: context.textTheme.headlineSmall!.copyWith(
                      color: context.color.primary,
                      // Dark purple color for text
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "👋",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              8.gap,
              Text(
                "Please enter your login information below to access your account",
                style: context.textTheme.bodyMedium!.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              12.gap,
              CustomTextField.primary(
                keyboardType: TextInputType.emailAddress,
                error: state.emailError,
                title: "Username",
                hintText: "Enter your email",
                prefixIcon: Assets.icon.mail.svg(
                  colorFilter: ColorFilter.mode(
                    context.color.primary,
                    BlendMode.srcIn,
                  ),
                ),
                onChanged: (value) {
                  context.read<LoginBloc>().add(EmailChangedEvent(value));
                },
              ),
              12.gap,
              CustomTextField.password(
                error: state.passwordError,
                title: "Password",
                hintText: "Enter your password",
                onChanged: (value) {
                  context.read<LoginBloc>().add(PasswordChangedEvent(value));
                },
                prefixIcon: Assets.icon.keyMinimalistic.svg(
                  colorFilter: ColorFilter.mode(
                    context.color.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              12.gap,
              Row(
                children: [
                  const Spacer(),
                  CustomButton.naked(
                      text: "Forgot password",
                      onPressed: () {
                        context
                            .read<LoginBloc>()
                            .add(const ForgotPasswordEvent());
                        // Navigate to forgot password page
                      }),
                ],
              ),
              12.gap,
              CustomButton.primary(
                loading: state.loading,
                enabled: !state.loading,
                text: "Login",
                onPressed: state.loading
                    ? null
                    : () {
                        context.read<LoginBloc>().add(const SubmitLoginEvent());
                      },
              ),
              24.gap,
              Align(
                alignment: Alignment.center,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: context.textTheme.titleSmall!.copyWith(
                      color: context.color.coolGray500,
                    ),
                    children: [
                      TextSpan(
                        text: "Register",
                        style: context.textTheme.titleSmall!.copyWith(
                          color: context.color.primary,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            context
                                .read<LoginBloc>()
                                .add(const RegisterPageEvent());
                            // Navigate to registration page
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
