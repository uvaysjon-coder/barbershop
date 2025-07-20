import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:barbershop/core/widgets/custom_text_field.dart';
import 'package:barbershop/features/auth/register/presentation/widgets/register_listener.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/register_bloc.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RegisterListener(
      child: SafeArea(
        child: BlocBuilder<RegisterBloc, RegisterState>(
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: AppSpacing.a20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register here ',
                          style: context.textTheme.headlineMedium?.copyWith(
                            color: context.color.primary,
                          ),
                        ),
                        Text(
                          'Please enter the authentication code that we have sent to your email ',
                          style: context.textTheme.bodyLarge?.copyWith(
                            color: context.color.coolGray500,
                          ),
                        ),
                        12.gap,
                        CustomTextField.primary(
                          onChanged: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(NameChangedEvent(value));
                          },
                          error: state.nameError,
                          title: 'Name',
                          hintText: 'Enter your name',
                          keyboardType: TextInputType.text,
                          prefixIcon:
                          Assets.icon.user.svg(
                            colorFilter: ColorFilter.mode(
                                context.color.primary, BlendMode.srcIn),
                          ),
                        ),
                        12.gap,
                        CustomTextField.primary(
                          onChanged: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(EmailChangedEvent(value));
                          },
                          error: state.emailError,
                          title: 'Email',
                          hintText: 'Enter your email',
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon:
                          Assets.icon.mail.svg(
                            colorFilter: ColorFilter.mode(
                                context.color.primary, BlendMode.srcIn),
                          ),
                        ),
                        12.gap,
                        CustomTextField.phoneNumber(
                          onChanged: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PhoneChangedEvent(value));
                          },
                          error: state.phoneError,
                          /*suffixIcon:
                              Icon(Icons.phone, color: context.color.primary),*/
                          title: 'Phone Number',
                          hintText: '99 999 99 99',
                          prefixIcon: Text('+998',
                              style: context.textTheme.bodyMedium
                                  ?.copyWith(color: context.color.black)),
                        ),
                        12.gap,
                        CustomTextField.password(
                          onChanged: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordChangedEvent(value));
                          },
                          error: state.passwordError,
                          title: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: Assets.icon.keyMinimalistic.svg(
                            colorFilter: ColorFilter.mode(
                                context.color.primary, BlendMode.srcIn),
                          ),
                        ),
                        12.gap,
                        CustomTextField.password(
                          onChanged: (value) {
                            context
                                .read<RegisterBloc>()
                                .add(PasswordConfirmChangedEvent(value));
                          },
                          error: state.passwordError,
                          title: 'Confirm Password',
                          hintText: 'Enter your password',
                          prefixIcon: Assets.icon.keyMinimalistic.svg(
                            colorFilter: ColorFilter.mode(
                                context.color.primary, BlendMode.srcIn),
                          ),
                        ),
                        24.gap,
                        CustomButton.primary(
                          loading: state.loading,
                          enabled: !state.loading,
                          height: 60,
                          text: "Register",
                          onPressed: () {
                            context.read<RegisterBloc>().add(
                                  const SubmitRegisterEvent(),
                                );
                          },
                        ),
                        24.gap,
                        Center(
                          child: RichText(
                            text: TextSpan(
                              text: 'Already have an account? ',
                              style: context.textTheme.titleSmall
                                  ?.copyWith(color: context.color.coolGray500),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: context.textTheme.titleSmall
                                      ?.copyWith(color: context.color.primary),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      context.read<RegisterBloc>().add(
                                            const LoginPageEvent(),
                                          );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ));
  }
}
