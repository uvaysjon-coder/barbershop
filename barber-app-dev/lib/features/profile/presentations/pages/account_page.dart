import 'package:barbershop/core/constants/app_constants.dart';
import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:barbershop/core/widgets/custom_text_field.dart';
import 'package:barbershop/features/profile/presentations/widgets/profile_listener.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import '../bloc/profile_bloc.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Account'),
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
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
            return SafeArea(
              child: ProfileListener(
                child: Padding(
                  padding: AppSpacing.h16,
                  child: KeyboardDismisser(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          70.gap,
                          InkWell(
                            radius: 150,
                            borderRadius: BorderRadius.circular(8),
                            onTap: () {
                              pPrint("ImageUpdate onTap");
                              context
                                  .read<ProfileBloc>()
                                  .add(const ImageUpdate());
                            },
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                (state.user?.profileImgUrl != null &&
                                        state.user?.profileImgUrl != (" "))
                                    ? CircleAvatar(
                                        radius: 65,
                                        backgroundImage:
                                            CachedNetworkImageProvider(
                                          AppConstants.imgUrl +
                                              state.user!.profileImgUrl!,
                                        ),
                                      )
                                    : Icon(
                                        Icons.person_4,
                                        size: 130,
                                        color: context.color.primary,
                                      ),
                                Positioned(
                                  bottom: 20,
                                  right: 20,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: ColoredBox(
                                      color: context.color.primary,
                                      child: Assets.icon.edit.svg(
                                        width: 32,
                                        height: 32,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            state.user?.name ?? "your name",
                            style: context.text.titleMedium?.copyWith(
                              color: context.color.primary,
                            ),
                          ),
                          18.gap,
                          AbsorbPointer(
                            child: CustomTextField.primary(
                              title: "Email",
                              textFieldText: state.user?.email,
                              prefixIcon: Assets.icon.mail.svg(
                                  height: 24,
                                  width: 24,
                                  colorFilter: ColorFilter.mode(
                                      context.color.primary, BlendMode.srcIn)),
                            ),
                          ),
                          18.gap,
                          CustomTextField.primary(
                            title: "Name",
                            prefixIcon: Assets.icon.keyMinimalistic.svg(
                                height: 24,
                                width: 24,
                                colorFilter: ColorFilter.mode(
                                    context.color.primary, BlendMode.srcIn)),
                            enabled: true,
                            textFieldText: state.user?.name,
                            onChanged: (value) {
                              context
                                  .read<ProfileBloc>()
                                  .add(EditNameEvent(value));
                            },
                          ),
                          30.gap,
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        // floatingActionButton o'rniga bottomNavigationBar ishlating
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
            // Klaviatura ochilganda pastdan qo'shimcha joy
          ),
          child: SafeArea(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return CustomButton.primary(
                  onPressed: () {
                    pPrint("SaveButtonPressed");
                    context
                        .read<ProfileBloc>()
                        .add(const EditSaveButtonEvent());
                  },
                  loading: state.isLoading,

                  enabled: state.user?.name != state.name && state.isLoading == false,

                  text: "Save",
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
