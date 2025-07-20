
import 'package:barbershop/core/themes/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../entities/barber_entities.dart';


class SmallBarberItem extends StatelessWidget {
  final BarberEntities barberEntities;
  final Function(String)? onTap;
  final bool isNight;

  const SmallBarberItem({
    super.key,
    this.onTap,
    required this.barberEntities,
    this.isNight = false,
  });

  @override
  Widget build(BuildContext context) {
    ///1620.1671981439,

    final double distance = double.tryParse(barberEntities.distance ?? "0") ?? 0.0;
    final kmText = distance > 1.0 ? "(${distance.toStringAsFixed(2)}) km" : "";
    // pPrint(AppConstants.baseUrl.substring(0,AppConstants.baseUrl.length-1)+barberEntities.largeImg!,1);
    return InkWell(

      splashFactory: InkRipple.splashFactory,

      borderRadius: AppBorders.r8,
      onTap: () {
        onTap?.call(barberEntities.id ?? "");
      },
      child: Padding(
        padding: AppSpacing.v4,
        child: Row(
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: AppBorders.r8,
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (_, url, __) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                  imageUrl: AppConstants.imgUrl+barberEntities.smallImg! ??
                      "https://cdn.shopify.com/s/files/1/0001/9211/8835/files/Happy_Barber_and_Customer_Men_s_Hairstyle_480x480.png?v=2421594670",
                ),
              ),
            ),
            8.gap,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    barberEntities.name,
                    style: context.text.titleMedium
                        ?.copyWith(color: isNight ? context.color.white : null),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  8.gap,
                  Row(
                    children: [
                      Assets.icon.location.svg(
                        width: 24,
                        height: 24,
                        colorFilter: ColorFilter.mode(
                            isNight ? context.color.white : context.color.primary,
                            BlendMode.srcIn),
                      ),
                      4.gap,
                      Expanded(
                        child: Text(
                          maxLines: 1,
                          "${barberEntities.address} $kmText",
                          style: context.text.labelLarge?.copyWith(
                            color: isNight ? context.color.white : null,
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
                            isNight ? context.color.white : context.color.primary,
                            BlendMode.srcIn),
                      ),
                      4.gap,
                      Expanded(
                        child: Text(barberEntities.rating.toString() ?? "?",
                            style: context.text.labelLarge?.copyWith(
                                color: isNight ? context.color.white : null)),
                      ),
                    ],
                  ),
                  8.gap,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}