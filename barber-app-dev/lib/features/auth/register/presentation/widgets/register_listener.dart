import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/core/widgets/custum_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../otp/presentation/bloc/otp_bloc.dart';
import '../../../otp/presentation/otp_page.dart';
import '../bloc/register_bloc.dart';

class RegisterListener extends StatelessWidget {
  final Widget child;

  const RegisterListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
          context.toast.error(state.errorMessage!);
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(
          //     SnackBar(
          //       behavior: SnackBarBehavior.floating,
          //       content: Text('Error: ${state.errorMessage}'),
          //     ),
          //   );
        }
        if (state.statusMessage != null && state.statusMessage!.isNotEmpty) {
          context.toast.success(state.statusMessage!);
          // ScaffoldMessenger.of(context)
          //   ..hideCurrentSnackBar()
          //   ..showSnackBar(
          //     SnackBar(
          //       behavior: SnackBarBehavior.floating,
          //       content: Text('${state.statusMessage}'),
          //     ),
          //   );
        }

        switch (state.eventRegisterState) {
          case EventRegisterState.login:
            context.mounted ? Navigator.of(context).pop() : null;
            break;
          case EventRegisterState.register:
            break;
          // TODO: Handle this case.
          case EventRegisterState.otp:
            context.read<OtpBloc>().add(RegisterOtpEvent(state.userId!));
            context.pushWithSlide(
              page: const OtpPage(),
            )
                .whenComplete(
                  () => context.mounted
                      ? context
                          .read<RegisterBloc>()
                          .add(const RegisterInitialEvent())
                      : null,
                );
            break;
        }
      },
      child: child,
    );
  }
}
