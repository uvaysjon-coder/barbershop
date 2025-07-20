
import 'package:barbershop/core/constants/app_constants.dart';
import 'package:barbershop/core/themes/app_theme.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:barbershop/features/dashboard/presentations/bloc/dashboard_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile/presentations/bloc/profile_bloc.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((ProfileBloc bloc)=> bloc.state.user);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /*Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on,
                    color: context.color.primary,
                  ),
                  4.gap,
                  Text(
                    user?.name ?? "John Doe",
                    style: context.text.labelLarge?.copyWith(
                      color: context.color.coolGray500,
                  ),),
                ],
              ),*/
              Text(
                textAlign: TextAlign.center,
                user?.name ?? "New York, USA",
                style: context.text.titleMedium,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            context.read<DashboardCubit>().changeIndex(3);
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: context.color.white,
            child: ClipOval(
              child: user?.profileImgUrl != null ? CachedNetworkImage(
                imageUrl:  AppConstants.imgUrl+ user!.profileImgUrl!,
                fit: BoxFit.cover,
                width: 50, // radius * 2
                height: 50,
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ) : Icon(
                Icons.person_4,
                size: 50,
                color: context.color.primary,
              )
            ),
          ),
        ),


      ],
    );
  }
}
