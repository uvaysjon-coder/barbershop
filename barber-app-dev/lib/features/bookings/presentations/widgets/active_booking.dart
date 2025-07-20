import 'package:barbershop/core/constants/app_constants.dart';
import 'package:barbershop/core/entities/booking_entities.dart';
import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/widgets/action_icon_button.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class ActiveBooking extends StatelessWidget {
  final BookingEntities booking;
  final Function(BookingEntities)? onTap;

  const ActiveBooking({super.key, required this.booking, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!(booking);
        }
      },
      child: Card(
        borderOnForeground: true,
        elevation: 5,
        child: Padding(
          padding: AppSpacing.a12,
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: AppBorders.r8,
                    child: CachedNetworkImage(
                      imageUrl: AppConstants.imgUrl + booking.largeImageUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                              child: CircularProgressIndicator(
                                  value: downloadProgress.progress)),
                      errorWidget: (_, url, __) => const Icon(Icons.error),
                      fit: BoxFit.cover,
                      width: context.width * 0.3,
                    ),
                  ),
                  8.gap,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          booking.shopName,
                          style: context.text.titleMedium?.copyWith(
                            color: context.color.black,
                          ),
                        ),
                        4.gap,
                        Row(
                          children: [
                            Assets.icon.location.svg(
                              colorFilter: ColorFilter.mode(
                                context.color.coolGray500,
                                BlendMode.srcIn,
                              ),
                            ),
                            8.gap,
                            Expanded(
                              child: Text(
                                booking.address,
                                style: context.text.bodyMedium?.copyWith(
                                  color: context.color.coolGray500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        4.gap,
                        Row(
                          children: [
                            Assets.icon.start.svg(
                              colorFilter: ColorFilter.mode(
                                context.color.coolGray500,
                                BlendMode.srcIn,
                              ),
                            ),
                            8.gap,
                            Expanded(
                              child: Text(
                                booking.rating.toString(),
                                style: context.text.bodyMedium?.copyWith(
                                  color: context.color.coolGray500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
             /* Divider(
                color: context.color.coolGray300,
              ),*/
              8.gap,
              const DottedLine(),

              8.gap,

              ///2025-06-05T12:00:00Z
              Row(children: [
                Assets.icon.calendarMark.svg(
                  colorFilter: ColorFilter.mode(
                    context.color.primary,
                    BlendMode.srcIn,
                  ),
                  height: 24,
                  width: 24,
                ),
                8.gap,
                Text(
                  "Date ${booking.scheduleStartTime?.day}/${booking.scheduleStartTime?.month}/${booking.scheduleStartTime?.year} - ${booking.scheduleStartTime?.hour}:${booking.scheduleStartTime!.minute < 10 ? "0${booking.scheduleStartTime?.minute}" : booking.scheduleStartTime?.minute}",
                )
              ]),

              8.gap,
              const DottedLine(),

              8.gap,

              Row(
                children: [
                  ActionIconButton(
                    icon: Assets.icon.logosGoogleMaps.path,
                    label: "Maps",
                    onTap: () {
                      print("Maps");
                    },
                  ),
                  (context.width * 0.1).gap,
                  ActionIconButton(
                    icon: Assets.icon.chat.path,
                    label: "Chat",
                    onTap: () {
                      print("Chat");
                    },
                  ),
                  const Spacer(),
                  SizedBox(
                    width: context.width * 0.3,
                    child: CustomButton.primary(
                      enabled: false,
                      text: "Cancel",
                      onPressed: () {},
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
