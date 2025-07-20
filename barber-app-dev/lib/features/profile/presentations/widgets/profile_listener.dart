import 'dart:io';

import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/features/auth/login/presentation/login_page.dart';
import 'package:barbershop/features/profile/presentations/pages/edit_password_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/profile_bloc.dart';
import '../pages/account_page.dart';

class ProfileListener extends StatelessWidget {
  final Widget child;

  const ProfileListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listenWhen: (previous, current) {
        pPrint("ProfileListener $current");
        return current.uiEvent != previous.uiEvent;
      },
      listener: (context, state) async {
        switch (state.uiEvent) {
          case ProfileUiEvent.logout:
            context.pushAndRemoveUntilWithSlide(
              page: const LoginPage(),
              predicate: (_) => false,
            );
            break;

          case ProfileUiEvent.imageSelect:
            final ImagePicker picker = ImagePicker();

            // Pick an image from gallery
            final XFile? pickedImage =
                await picker.pickImage(source: ImageSource.gallery);

            if (pickedImage != null) {
              // Convert XFile to File
              File imageFile = File(pickedImage.path);

              // Add the event with the selected image file
              context.mounted
                  ? context
                      .read<ProfileBloc>()
                      .add(ProfileImageUpdateEvent(imageFile))
                  : null;
            }
            break;

          case ProfileUiEvent.editAccount:
            // Handle edit account event
            context.pushWithSlide(page: const AccountPage())
                .whenComplete(() {
              context.mounted
                  ? context.read<ProfileBloc>().add(const BuildStateEvent())
                  : null;
            });
            break;

          case ProfileUiEvent.editPassword:
            // Handle edit account event
           context.pushWithSlide(page: const EditPasswordPage())
                .whenComplete(() {
              context.mounted
                  ? context.read<ProfileBloc>().add(const BuildStateEvent())
                  : null;
            });
            break;

          default:
            break;
        }
      },
      child: child,
    );
  }
}
