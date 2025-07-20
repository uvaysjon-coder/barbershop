
import 'package:barbershop/core/constants/app_constants.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:barbershop/features/main/detail_barber/domain/entities/detail_barber_entities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/themes/index.dart';
import '../bloc/detail_barber_bloc.dart';


class DetailTop extends StatelessWidget {

  const DetailTop({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DetailBarberBloc, DetailBarberState,DetailBarberEntities?>(
      selector: (state) => state.detailBarber,

  builder: (context, state) {
      //  pPrint("DetailTop: ${state?.name}");
    return Padding(

      padding: AppSpacing.h12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: AppBorders.r8,
            child: SizedBox(
              height: 230,
              width: context.width,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (_, url, __) => const Icon(Icons.error),
                    fit: BoxFit.cover,
                    width: context.width,
                    imageUrl: state != null ? AppConstants.imgUrl + state.largeImageUrl :
                        "https://cdn.shopify.com/s/files/1/0001/9211/8835/files/Happy_Barber_and_Customer_Men_s_Hairstyle_480x480.png?v=1621594670",
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Row(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.width * 0.3,
                          child: CustomButton.primary(
                              leading: Assets.icon.calendarMark.svg(
                                colorFilter: ColorFilter.mode(context.color.white, BlendMode.srcIn),
                              ),
                              text: state?.shopType ?? "Open",
                              backgroundColor:  const Color(0xff27AE60),
                              onPressed: () {
                                print("Booking now");
                              }),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          8.gap,
          Text(state?.name ?? "", style: context.text.titleMedium,maxLines: 1,overflow: TextOverflow.ellipsis,),
          8.gap,
          Row(
            children: [
              Assets.icon.location.svg(width: 24, height: 24),
              4.gap,
              Expanded(child: Text(state?.address ?? "", style: context.text.labelLarge)),
            ],
          ),
          8.gap,
          Row(
            children: [
              Assets.icon.start.svg(width: 24, height: 24),
              4.gap,
              Expanded(child: Text(state?.rating.toString() ?? "?", style: context.text.labelLarge)),
            ],
          ),
        ],
      ),
    );
  },
);
  }
}
