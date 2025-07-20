import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/features/auth/otp/presentation/bloc/otp_bloc.dart';
import 'package:barbershop/features/auth/otp/presentation/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../forgot/presentation/forgot_page.dart';
import '../../../register/presentation/register_page.dart';
import '../bloc/login_bloc.dart';

class LoginListener extends StatelessWidget {
  final Widget child;

  const LoginListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (_, state) {
        switch (state.eventLoginState) {
          case EventLoginState.login:
            break;
          case EventLoginState.register:
            context
                .pushWithSlide(
                  page: const RegisterPage(),
                )
                .whenComplete(() => context.mounted
                    ? context.read<LoginBloc>().add(const LoginInitialEvent())
                    : null);
            break;
          case EventLoginState.forgotPassword:
            context
                .pushWithSlide(
                  page: const ForgotPage(),
                )
                .whenComplete(() => context.mounted
                    ? context.read<LoginBloc>().add(const LoginInitialEvent())
                    : null);

            break;
          case EventLoginState.otp:
            context.read<OtpBloc>().add(LoginOtpEvent(state.userId!));
            context
                .pushWithSlide(
                  page: const OtpPage(),
                )
                .whenComplete(() => context.mounted
                    ? context.read<LoginBloc>().add(const LoginInitialEvent())
                    : null);
            break;
        }
      },
      child: child,
    );
  }
}
