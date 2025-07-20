import 'package:barbershop/core/constants/app_constants.dart';
import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/features/profile/presentations/bloc/profile_bloc.dart';
import 'package:barbershop/features/profile/presentations/pages/about_profile_page.dart';
import 'package:barbershop/features/profile/presentations/widgets/profile_listener.dart';
import 'package:barbershop/features/profile/presentations/widgets/profile_notification.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_button.dart';
import 'pages/help_profile_page.dart';
import 'widgets/profile_items.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero).then((_) {
      if (context.mounted) {
         context.read<ProfileBloc>().add(const ProfileInitialEvent());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.color.primary,
          appBar: AppBar(
              backgroundColor: context.color.primary,
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.icon.appIcon.svg(
                      width: 36,
                      fit: BoxFit.scaleDown,
                      height: 36,
                    ),
                    8.gap,
                    Text(
                      "GoBar",
                      style: context.text.titleMedium?.copyWith(
                        color: context.color.white,
                      ),
                    ),
                    16.gap,
                  ],
                ),
              ],
              title: Text(
                'Profile',
                style: context.text.titleMedium?.copyWith(
                  color: context.color.white,
                ),
              )),
          body: ProfileListener(
            child: Stack(
              children: [
                Assets.img.loginBg.image(
                  colorBlendMode: BlendMode.darken,
                  fit: BoxFit.cover,
                  width: context.width,
                ),
                Column(
                  children: [
                    Padding(
                      padding: AppSpacing.a20,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: context.color.white,
                                child: ClipOval(
                                    child: state.user?.profileImgUrl != null
                                        ? CachedNetworkImage(
                                      imageUrl: AppConstants.imgUrl +
                                          state.user!.profileImgUrl!,
                                      fit: BoxFit.cover,
                                      width: 50,
                                      // radius * 2
                                      height: 50,
                                      placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                    )
                                        : Icon(
                                      Icons.person_4,
                                      size: 50,
                                      color: context.color.primary,
                                    )),
                              ),
                              12.gap,
                              Expanded(
                                child: Text(
                                  state.user?.name ?? "your name",
                                  style: context.text.titleMedium?.copyWith(
                                    color: context.color.white,
                                  ),
                                ),
                              ),
                              InkWell(
                                radius: 50,
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {
                                  context
                                      .read<ProfileBloc>()
                                      .add(const EditAccountEvent());
                                },
                                child: Assets.icon.edit.svg(
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ],
                          ),
                          20.gap,
                          Row(
                            children: [
                              12.gap,
                              Assets.icon.mail.svg(
                                height: 24,
                                width: 24,
                                colorFilter: ColorFilter.mode(
                                  context.color.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                              12.gap,
                              Expanded(
                                child: Text(
                                  state.user?.email ?? "your email",
                                  style: context.text.bodyLarge?.copyWith(
                                    color: context.color.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          12.gap,
                        ],
                      ),
                    ),
                    20.gap,
                    Expanded(
                      child: Container(
                        padding: AppSpacing.a20,
                        width: context.width,
                        decoration: BoxDecoration(
                          color: context.color.white,
                          borderRadius: AppBorders.tl24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Settings",
                              style: context.text.titleSmall?.copyWith(
                                color: context.color.coolGray500,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Notification",
                                          style: context.text.titleMedium
                                              ?.copyWith(
                                            color: context.color.primary,
                                          ),
                                        ),
                                      ),
                                      // /*Cupertino*/ Switch(
                                      //   activeColor: context.color.primary,
                                      //   value: boolss,
                                      //   onChanged: (value) {
                                      //     setState(() {
                                      //       boolss = value;
                                      //     });
                                      //     print("Notification");
                                      //   },
                                      // ),
                                      const ProfileNotification()
                                    ],
                                  ),
                                  Divider(
                                    color: context.color.coolGray100,
                                    thickness: 0.5,
                                  ),
                                  ProfileItems(
                                    "Account",
                                    onTap: () {
                                      context.read<ProfileBloc>().add(const EditAccountEvent());
                                    },
                                  ),
                                  Divider(
                                    color: context.color.coolGray100,
                                    thickness: 0.5,
                                  ),
                                  ProfileItems(
                                    "Security",
                                    onTap: () {
                                      context.read<ProfileBloc>().add(const EditPasswordEvent());

                                    },
                                  ),
                                  Divider(
                                    color: context.color.coolGray100,
                                    thickness: 0.5,
                                  ),
                                  /*  ProfileItems(
                                "Language",
                                onTap: () {
                                  print("Language");
                                },
                              ),*/
                                  /*Divider(
                                color: context.color.coolGray100,
                                thickness: 0.5,
                              ),*/
                                  ProfileItems(
                                    "Help",
                                    onTap: () {

                                      context.pushWithSlide(
                                          page: const HelpProfilePage()
                                      );
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //         const HelpProfilePage()));

                                      print("Privacy Policy");
                                    },
                                  ),
                                  Divider(
                                    color: context.color.coolGray100,
                                    thickness: 0.5,
                                  ),
                                  ProfileItems(
                                    "About",
                                    onTap: () {
                                      context.pushWithSlide(
                                          page: const AboutProfilePage()
                                      );
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //         const AboutProfilePage()));

                                     // print("Privacy Policy");
                                     /* Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const AboutProfilePage()));

                                      print("Privacy Policy");*/
                                    },
                                  ),
                                  Divider(
                                    color: context.color.coolGray100,
                                    thickness: 0.5,
                                  ),
                                ],
                              ),
                            ),
                            CustomButton.primary(
                              text: "Log Out",
                              onPressed: () {
                                context.read<ProfileBloc>().add(const LogoutEvent());
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
