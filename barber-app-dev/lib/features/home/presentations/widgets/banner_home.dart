import 'package:barbershop/core/extension/navigation_extension.dart';
import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/utils/print.dart';
import 'package:barbershop/core/utils/utils.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:barbershop/features/bookings/presentations/booking_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../bookings/presentations/bloc/booking_bloc.dart';
import '../bloc/home_bloc.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingBloc, BookingState>(
      builder: (context, state) {
        if (state.isLoading == true && state.activeBookings.isEmpty) {
          pPrint("Loading shimmer");
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              height: context.height * 0.3,
              width: context.width,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: context.height * 0.3,
                  width: context.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: AppBorders.r8,
                  ),
                  child: Padding(
                    padding: AppSpacing.a20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: context.width * 0.6,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: AppBorders.r4,
                          ),
                        ),
                        16.gap,
                        Container(
                          width: context.width * 0.4,
                          height: 16,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: AppBorders.r4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }

        if (state.activeBookings.isNotEmpty) {
          final booking = state.activeBookings.first;

          return GestureDetector(
            onTap: () {
              context.pushWithSlide(page: BookingDetailPage(booking: booking));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: AppBorders.r8,
              ),
              padding: AppSpacing.h20,
              height: context.height * 0.3,
              child: ClipRRect(
                borderRadius: AppBorders.r12,

                child: Stack(
                  children: [
                    ColoredBox(
                      color: context.color.primary,
                      child: Assets.img.loginBg.image(
                        fit: BoxFit.cover,
                        width: context.width,
                      ),
                    ),
                    Padding(
                      padding: AppSpacing.a20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        maxLines: 3,
                                        booking.shopName,
                                        style: context.text.headline2?.copyWith(
                                          color: context.color.white,
                                        ),
                                      ),
                                      8.gap,
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Assets.icon.location.svg(
                                            height: 32,
                                            width: 32,
                                            colorFilter: ColorFilter.mode(
                                              context.color.white,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          8.gap,
                                          Text(
                                            booking.address,
                                            style: context.text.titleLarge
                                                ?.copyWith(
                                              color: context.color.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                8.gap,
                                InkWell(
                                  splashFactory: InkRipple.splashFactory,
                                  borderRadius: AppBorders.r8,
                                  onTap: () {

                                    /* context.read<HomeBloc>().add(OpenMaps(
                                      booking.shopName,
                                      booking.latitude,
                                      booking.longitude,
                                    ));*/
                                  },
                                  child: Column(
                                    children: [
                                      Assets.icon.logosGoogleMaps.svg(
                                        height: 32,
                                        width: 32,
                                      ),
                                      2.gap,
                                      Text(
                                        "Maps",
                                        style: context.text.titleSmall
                                            ?.copyWith(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    context.color.white,
                                                color: context.color.white),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          8.gap,
                          Divider(
                            color: context.color.white,
                          ),
                          8.gap,
                          Text(
                            "Date & Time",
                            style: context.text.labelMedium?.copyWith(
                              color: context.color.white,
                            ),
                          ),
                          Row(children: [
                            Assets.icon.calendarMark.svg(
                              colorFilter: ColorFilter.mode(
                                context.color.white,
                                BlendMode.srcIn,
                              ),
                              height: 24,
                              width: 24,
                            ),
                            8.gap,
                            Text(
                              " ${booking.scheduleStartTime?.day} ${getMonth(booking.scheduleStartTime?.month ?? 0)} ${booking.scheduleStartTime?.year} - ${booking.scheduleStartTime?.hour}:${booking.scheduleStartTime!.minute < 10 ? "0${booking.scheduleStartTime?.minute}" : booking.scheduleStartTime?.minute}",
                              style: context.text.labelSmall?.copyWith(
                                color: context.color.white,
                              ),
                            )
                          ]),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }

        return SizedBox(
          height: context.height * 0.3,
          child: Stack(
            children: [
              Container(
                color: context.color.secondary,
              ),
              Assets.img.loginBg.image(
                fit: BoxFit.cover,
                width: context.width,
                height: context.height * 0.3,
              ),
              Positioned(
                right: 0,
                child: Assets.img.onboardingThree.image(
                  fit: BoxFit.contain,
                  height: context.height * 0.4,
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  padding: AppSpacing.a8,
                  decoration: BoxDecoration(
                    color: context.color.secondary500,
                    borderRadius: AppBorders.r4,
                  ),
                  child: Assets.icon.appIcon.svg(height: 60),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: SizedBox(
                  width: context.width * 0.4,
                  child: CustomButton.primary(
                      text: "Booking now",
                      onPressed: () {
                        context.read<HomeBloc>().add(ExploreBarber());
                      }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
