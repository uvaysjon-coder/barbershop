import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:barbershop/core/widgets/custom_text_field.dart';
import 'package:barbershop/features/profile/presentations/widgets/profile_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../bloc/profile_bloc.dart';

class EditPasswordPage extends StatelessWidget {
  const EditPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Security'),
      ),
      body: ProfileListener(
        child: KeyboardDismisser(
          child: SafeArea(
            child: Padding(
              padding: AppSpacing.h16,
              child: KeyboardDismisser(
                child: SingleChildScrollView(
                  child: BlocConsumer<ProfileBloc, ProfileState>(
                    listener: (_,state){
                      switch(state.uiEvent){

                        case ProfileUiEvent.exit:
                          Navigator.pop(context);
                          break;

                        default:
                          break;
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextField.password(
                            title: "Password",
                            error: state.user?.password != state.passwordOne &&
                                state.passwordTwo != state.passwordOne &&
                                state.passwordTwo.isNotEmpty &&
                                state.passwordOne.isNotEmpty &&
                                state.user?.password != state.passwordTwo &&
                                state.user?.password != state.passwordOne &&
                                state.user?.password != state.passwordTwo,
                            prefixIcon: Assets.icon.keyMinimalistic.svg(
                                height: 24,
                                width: 24,
                                colorFilter: ColorFilter.mode(
                                    context.color.primary, BlendMode.srcIn)),
                            enabled: true,
                            textFieldText: state.user?.password ?? "",
                            onChanged: (value) {
                              context
                                  .read<ProfileBloc>()
                                  .add(EditPasswordOneEvent(value));
                            },
                          ),
                          30.gap,
                          CustomTextField.password(
                            title: "Confirm password",
                            error: state.user?.password != state.passwordOne &&
                                state.passwordTwo != state.passwordOne &&
                                state.passwordTwo.isNotEmpty &&
                                state.passwordOne.isNotEmpty &&
                                state.user?.password != state.passwordTwo &&
                                state.user?.password != state.passwordOne &&
                                state.user?.password != state.passwordTwo,
                            prefixIcon: Assets.icon.keyMinimalistic.svg(
                                height: 24,
                                width: 24,
                                colorFilter: ColorFilter.mode(
                                    context.color.primary, BlendMode.srcIn)),
                            enabled: true,
                            textFieldText: state.user?.password ?? "",
                            onChanged: (value) {
                              context
                                  .read<ProfileBloc>()
                                  .add(EditPasswordTwoEvent(value));
                            },
                          ),
                          30.gap,
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        child: SafeArea(
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return CustomButton.primary(
                loading: state.isLoading,
                enabled: state.user?.password != state.passwordOne &&
                    state.passwordTwo == state.passwordOne &&
                    state.passwordTwo.isNotEmpty &&
                    state.passwordOne.isNotEmpty &&

                    state.isLoading == false,
                onPressed: () {
                  pPrint("SaveButtonPressed");
                  context
                      .read<ProfileBloc>()
                      .add(const EditPasswordButtonEvent());
                },
                text: "Save",
              );
            },
          ),
        ),
      ),
    );
  }
}
