import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/core/themes/app_borders.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:barbershop/core/widgets/custum_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../bloc/detail_barber_bloc.dart';

class ActionsBar extends StatelessWidget {
  const ActionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBarberBloc, DetailBarberState>(
      buildWhen: (_, __) =>_.detailBarber != __.detailBarber,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

              state.detailBarber?.latitude != null && state.detailBarber?.longitude != null ? Flexible(
                child: _buildActionItem(
                    Assets.icon.logosGoogleMaps.path, "Location", context,onTap: () {
                 // openMap(state.detailBarber!.latitude, state.detailBarber!.longitude);

                  context.toast.success("Open Maps");

                      context.read<DetailBarberBloc>().add(const ShowLocation());
                }),
            ) : Container(),
            Flexible(
              child: _buildActionItem(Assets.icon.chat.path, "Chat", context,
              onTap: (){
                context.toast.warning("Coming son");
              }),
            ),
            Flexible(
              child: _buildActionItem(Assets.icon.share.path, "Share", context,
              onTap: (){
                context.toast.warning("Coming son");
              }),
            ),
            Flexible(
              child: _buildActionItem(Assets.icon.heart.path, "Like", context,
              onTap: (){
                context.toast.warning("Coming son");
              }),
            ),

          ],
        );
      },
    );
  }

  Widget _buildActionItem(String icon, String label, BuildContext context, {Function()? onTap}) {
    return InkWell(
      splashFactory: InkRipple.splashFactory,
      borderRadius: AppBorders.r8,
      onTap: onTap,
      child: Column(
        children: [
          SvgPicture.asset(icon),
          2.gap,
          Text(label, style: context.text.bodyMedium?.copyWith(
              color: context.color.primary)),
        ],
      ),
    );
  }
}
