import 'package:barbershop/core/constants/app_constants.dart';
import 'package:barbershop/core/entities/barber_entities.dart';
import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/core/themes/app_theme.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/themes/app_borders.dart';
import '../../../../core/themes/app_spacing.dart';

class BigBarberItem extends StatelessWidget {
  final Function(String)? onTap;
  final BarberEntities barberEntities;

  const BigBarberItem({super.key, required this.barberEntities, this.onTap});

  @override
  Widget build(BuildContext context) {
    final double distance = double.parse(barberEntities.distance ?? "0");
    final kmText = distance > 1.0 ? "(${distance.toStringAsFixed(2)}) km" : "";
    return Padding(
      padding: AppSpacing.h12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            splashFactory: InkRipple.splashFactory,
            borderRadius: AppBorders.r8,
            onTap: () {
              onTap?.call(barberEntities.id ?? "");
            },
            child: ClipRRect(
              borderRadius: AppBorders.r8,
              child: SizedBox(
                height: context.height * 0.3,
                width: context.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, downloadProgress) =>
                          Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress),
                          ),
                      errorWidget: (_, url, __) => const Icon(Icons.error),
                      fit: BoxFit.cover,
                      width: context.width,
                      imageUrl:AppConstants.imgUrl + barberEntities.largeImg! ??
                          "https://cdn.shopify.com/s/files/1/0001/9211/8835/files/Happy_Barber_and_Customer_Men_s_Hairstyle_480x480.png?v=1621594670",
                      fadeInDuration: const Duration(milliseconds: 200),
                      memCacheWidth: (context.width * 1.5).toInt(),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: SizedBox(
                        width: context.width * 0.4,
                        child: CustomButton.primary(
                            leading: Assets.icon.calendarMark.svg(
                              colorFilter: ColorFilter.mode(context.color.white, BlendMode.srcIn),
                            ),
                            text: "Booking",
                            onPressed: () {
                              onTap?.call(barberEntities.id ?? "");
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          8.gap,
          Text(barberEntities.name, style: context.text.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis,),
          8.gap,
          Row(
            children: [
              Assets.icon.location.svg(
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                   /* isNight ? context.color.white :*/ context.color.primary,
                    BlendMode.srcIn),
              ),
              4.gap,
              Expanded(
                child: Text(
                  maxLines: 1,
                  "${barberEntities.address} $kmText",
                  style: context.text.labelLarge?.copyWith(
                    color: /*isNight ? context.color.white :*/ null,
                  ),
                ),
              ),
            ],
          ),
          8.gap,
          barberEntities.rating == null
              ? const SizedBox()
              :
          Row(
            children: [
              Assets.icon.start.svg(
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                    /*isNight ? context.color.white :*/ context.color.primary,
                    BlendMode.srcIn),
              ),
              4.gap,
              Expanded(
                child: Text(barberEntities.rating.toString() ?? "?",
                    style: context.text.labelLarge?.copyWith(
                        color:/* isNight ? context.color.white :*/ null)),
              ),
            ],
          ),
          8.gap,
        ],
      ),
    );
  }
}