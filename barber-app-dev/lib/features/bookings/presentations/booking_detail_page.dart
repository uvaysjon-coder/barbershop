import 'package:barbershop/core/constants/app_constants.dart';
import 'package:barbershop/core/entities/booking_entities.dart';
import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/core/widgets/custom_button.dart';
import 'package:barbershop/core/widgets/custum_toast.dart';
import 'package:barbershop/features/main/detail_barber/domain/entities/haircut_styles_entities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/utils.dart';
import '../../main/booking_appointment/presentation/widgets/select_service_item_big.dart';

class BookingDetailPage extends StatelessWidget {
  final BookingEntities booking;

  const BookingDetailPage({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    final isActive = booking.status.toLowerCase() == "active";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Barber',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacing.a16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.gap,
              ClipRRect(
                borderRadius: AppBorders.r12,
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
                  imageUrl: AppConstants.imgUrl + booking.largeImageUrl,
                  errorWidget: (value, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ),
              12.gap,
              Center(
                child: Text(
                  booking.shopName,
                  style: context.text.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              4.gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Assets.icon.location.svg(
                    colorFilter:
                        ColorFilter.mode(context.color.coolGray500, BlendMode.srcIn),
                  ),
                  8.gap,
                  Text(
                    booking.address,
                    style: context.text.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  8.gap,
                  Assets.icon.start.svg(
                    colorFilter: ColorFilter.mode(context.color.coolGray500, BlendMode.srcIn),

                  ),
                  8.gap,
                  Text(
                    booking.rating.toString(),
                    style: context.text.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const DottedLine(),

              Text(
                "Date & Time",
                style: context.text.titleMedium?.copyWith(
                  color: context.color.black,
                ),
              ),
              8.gap,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.icon.calendarMark.svg(
                    colorFilter: ColorFilter.mode(
                      context.color.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  8.gap,
                  Text(
                    "${booking.scheduleStartTime?.day} ${getMonth(booking.scheduleStartTime?.month ?? 0)} ${booking.scheduleStartTime?.year} - ${booking.scheduleStartTime?.hour}:${booking.scheduleStartTime!.minute < 10 ? "0${booking.scheduleStartTime?.minute}" : booking.scheduleStartTime?.minute}",
                    style: context.text.subHeadline3?.copyWith(
                      color: context.color.coolGray500,
                    ),
                  ),
                ],
              ),
              12.gap,
              const DottedLine(),
              Row(
                children: [
                  Assets.icon.scissors.svg(
                    colorFilter: ColorFilter.mode(
                      context.color.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  8.gap,
                  Text(
                    "Select services",
                    style: context.text.titleMedium?.copyWith(
                      color: context.color.black,
                    ),
                  ),
                ],
              ),
              /* const DottedLine(
                      dashLength: 4,
                      lineThickness: 2,
                      dashColor: AppColors.coolGray200,
                      direction: Axis.horizontal,
                    ),*/
              8.gap,
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ...List.generate(booking.services.length, (index) {
                    final service = booking.services[index];
                    final haircut = HaircutStylesEntities(
                      id: 0,
                      name: service.serviceName,
                      price: service.price,
                      serviceImageUrl: service.serviceImageUrl,
                      description: service.description,
                    );

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SelectServiceItemBig(
                        style: haircut,
                        onTap: (value) {},
                        readOnly: true,
                      ),
                    );
                  })
                ],
              ),
              12.gap,
              const DottedLine(),

              Text(
                "Payment summary",
                style: context.text.titleMedium,
              ),
              12.gap,
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: booking.services.length,
                separatorBuilder: (context, index) => 12.gap,
                itemBuilder: (context, index) {
                  final haircutStyle = booking.services[index];
                  // pPrint("haircutStyle: ${haircutStyle.id}");
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        haircutStyle.serviceName.split("_").join(" "),
                        style: context.text.titleSmall,
                      ),
                      Text(
                        haircutStyle.price,
                        style: context.text.bodyLarge,
                      ),
                    ],
                  );
                },
              ),
              12.gap,
              const DottedLine(),
              12.gap,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Full price",
                    style: context.text.titleSmall,
                  ),
                  Text(
                    booking.services.fold<double>(0, (previousValue, element) {
                      return previousValue + (double.tryParse(element.price) ?? 0);
                    }).toStringAsFixed(2),
                    style: context.text.bodyLarge,
                  ),
                ],
              ),
              20.gap,
              CustomButton.primary(
                leading: isActive ?null : Assets.icon.handStart.svg()  ,
                enabled: !isActive,
                text: isActive ? "Cancel" : "Rating & review",
                onPressed: () {
                  context.toast.warning("Coming soon");

                  // ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     behavior: SnackBarBehavior.floating,
                  //     content: Text(
                  //       "It will be launched soon.",
                  //     ),
                  //     duration: Duration(seconds: 4),
                  // ),
                  // );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
