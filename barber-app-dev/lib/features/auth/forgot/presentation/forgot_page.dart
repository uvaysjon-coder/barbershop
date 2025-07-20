import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/core/widgets/custom_text_field.dart';
import 'package:barbershop/features/auth/forgot/presentation/widgets/forgot_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_button.dart';
import 'bloc/forgot_bloc.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:Padding(
        padding: AppSpacing.a20,

        child: BlocBuilder<ForgotBloc, ForgotState>(
          builder: (context, state) {
            return CustomButton.primary(
              enabled: state.isButtonEnabled && !state.loading,
              loading: state.loading,
              text: "Send",
              onPressed: () {
                pPrint("ForgotPage");
                pPrint(state.loading);
                pPrint(state.isButtonEnabled);
                context.read<ForgotBloc>().add(const SubmitForgot());
              },
            );
          },
        ),
      ) ,
      body: ForgotListener(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: context.viewTop + 20,
              bottom: context.viewBottom + 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FractionallySizedBox(
                  alignment: Alignment.center,
                  widthFactor: 1,
                  child: Column(
                    children: [
                      Text("Forgot Password ?",
                          style: context.textTheme.headlineMedium?.copyWith(
                            color: context.color.primary,
                          )),
                      24.gap,
                      Text(
                          "Please enter your email for the password reset process",
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: context.color.coolGray500,
                          )
                      ),
                      24.gap,
                      CustomTextField.primary(
                        prefixIcon: Assets.icon.mail.svg(),
                        title: "Email",
                        hintText: "Email",

                        onChanged: (value) {

                          context.read<ForgotBloc>().add(ChangeEmail(email: value));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
