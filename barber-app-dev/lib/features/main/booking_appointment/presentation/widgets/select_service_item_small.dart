import 'package:barbershop/core/constants/app_constants.dart';
import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/core/themes/app_spacing.dart';
import 'package:barbershop/core/themes/app_theme.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SelectServiceItemSmall extends StatefulWidget {
  final String img;
  final String title;
  final String price;
  final bool? isSelected;
  final Function(String) onTap;

  const SelectServiceItemSmall({
    super.key,
    required this.img,
    required this.title,
    required this.price,
     this.isSelected,
    required this.onTap,
  });

  @override
  State<SelectServiceItemSmall> createState() => _SelectServiceItemSmallState();
}

class _SelectServiceItemSmallState extends State<SelectServiceItemSmall> {
  late bool isSelected ;

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
          isSelected = !isSelected;
          widget.onTap(widget.title);

        });
      },
      child: Padding(
        padding: AppSpacing.h12,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [


            isSelected ?  Stack(
              alignment: Alignment.center,
              children: [

                CircleAvatar(
                  radius: 30,
                  backgroundImage: CachedNetworkImageProvider( AppConstants.imgUrl + widget.img),
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: isSelected ? context.color.primary.withOpacity(0.3) :Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.check,
                    color: context.color.white,
                    size: 30,
                  ),
                ),
              ],
            ): CircleAvatar(
               radius: 30,
               backgroundImage: CachedNetworkImageProvider(AppConstants.imgUrl+widget.img),
             ),
            8.gap,
            SizedBox(
              width: context.width * 0.2,
              child: Text(
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                widget.title.split("_").join(" "),
                style: context.text.bodyMedium?.copyWith(
                  color: context.color.primary,
                )
              ),
            ),
            4.gap,
            Text(
              widget.price,
              style: context.text.bodySmall?.copyWith(
                color: context.color.coolGray500,
              )
            ),

          ],
        ),
      ),
    );
  }
}
