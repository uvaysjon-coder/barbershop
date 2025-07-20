import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/core/widgets/custum_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../otp/presentation/bloc/otp_bloc.dart';
import '../../../otp/presentation/otp_page.dart';
import '../bloc/forgot_bloc.dart';

class ForgotListener extends StatelessWidget {
  final Widget child;

  const ForgotListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotBloc, ForgotState>(
      listener: (context, state) {
        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          context.toast.error(state.errorMessage!);
        }

        switch (state.eventForgotState) {
          case EventForgotState.success:
            context.read<OtpBloc>().add(ForgotOtpEvent(state.userId!));
            context.pushWithSlide(
              page: const OtpPage(),
            ); {}
            break;
            break;
          default:
            break;
        }


      },
      child: child,
    );
  }
}
