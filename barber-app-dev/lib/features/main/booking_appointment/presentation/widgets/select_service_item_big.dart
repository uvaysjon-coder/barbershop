import 'package:barbershop/core/constants/app_constants.dart';
import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/core/themes/app_theme.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:barbershop/features/main/detail_barber/domain/entities/haircut_styles_entities.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SelectServiceItemBig extends StatefulWidget {
  final HaircutStylesEntities style;

  final bool? isSelected;
  final bool readOnly;
  final Function(String) onTap;

  const SelectServiceItemBig({
    required this.style,
    super.key,
    this.isSelected,
    this.readOnly = false,
    required this.onTap,
  });

  @override
  State<SelectServiceItemBig> createState() => _SelectServiceItemBigState();
}

class _SelectServiceItemBigState extends State<SelectServiceItemBig> {
  late bool isSelected;

  @override
  initState() {
    isSelected = widget.isSelected ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.readOnly) return;
          isSelected = !isSelected;
          widget.onTap(widget.style.name);
        });
      },
      child: !widget.readOnly
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                isSelected
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: CachedNetworkImageProvider(
                                AppConstants.imgUrl +
                                    widget.style.serviceImageUrl),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? context.color.primary.withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Icon(
                              Icons.check,
                              color: context.color.white,
                              size: 30,
                            ),
                          ),
                        ],
                      )
                    : CircleAvatar(
                        radius: 30,
                        backgroundImage: CachedNetworkImageProvider(
                            AppConstants.imgUrl +
                                widget.style.serviceImageUrl),
                      ),
                8.gap,
                SizedBox(
                  width: context.width * 0.2,
                  child: Text(
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      widget.style.name.split("_").join(" "),
                      style: context.text.bodyMedium?.copyWith(
                        color: context.color.primary,
                      )),
                ),
                4.gap,
                Text(widget.style.price,
                    style: context.text.bodySmall?.copyWith(
                      color: context.color.coolGray500,
                    )),
              ],
            )
          : Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider(
                      AppConstants.imgUrl + widget.style.serviceImageUrl),
                ),
                12.gap,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          widget.style.name.split("_").join(" "),
                          style: context.text.titleMedium?.copyWith(
                            color: context.color.primary,
                          )),
                      4.gap,
                      widget.style.description == null
                          ? const SizedBox():

                      Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          widget.style.description!.split("_").join(" "),
                          style: context.text.bodyMedium?.copyWith(
                            color: context.color.coolGray500,
                          )),
                    ],
                  ),
                ),
                4.gap,
                Text(widget.style.price,
                    style: context.text.bodyMedium?.copyWith(
                      color: context.color.black,
                    )),
              ],
            ),
    );
  }
}
