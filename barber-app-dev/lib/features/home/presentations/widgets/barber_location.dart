
import 'dart:ui';

import 'package:barbershop/core/themes/index.dart';
import 'package:flutter/material.dart';

class BarberLocation extends StatelessWidget {
  const BarberLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.h12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text("Find a barber nearby",style: context.text.titleLarge,),
          8.gap,

          SizedBox(
            height: context.height * 0.3,
            child: ClipRRect(
              borderRadius: AppBorders.r8,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Базовое изображение
                  Image.asset(
                    Assets.img.mapDemo.path,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: context.height * 0.3,
                  ),
                  // Эффект размытия с полупрозрачным контейнером
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                        alignment: Alignment.center,
                        child:  Text("Coming soon",
                        style: context.text.titleLarge?.copyWith(
                            color: context.color.black,
                            fontWeight: FontWeight.w600,
                          ),),
                      ),
                    ),
                  ),
                  // Здесь добавьте контент, который должен быть поверх размытия
                  // Positioned(
                  //   bottom: 8,
                  //   right: 8,
                  //   child: SizedBox(
                  //     width: context.width * 0.3,
                  //     child: CustomButton.primary(
                  //         text: "Find now",
                  //         leading: Assets.icon.searchNormal.svg(
                  //           colorFilter: ColorFilter.mode(context.color.white, BlendMode.srcIn),
                  //         ),
                  //         onPressed: () {}
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          )

          // SizedBox(
          //   height: context.height * 0.3,
          //   child: ClipRRect(
          //     borderRadius: AppBorders.r8,
          //     child: Stack(
          //       children: [
          //         Assets.img.map.image(
          //           fit: BoxFit.cover,
          //           width: double.infinity,
          //           height: context.height * 0.3,
          //         ),
          //         Positioned(
          //           bottom: 8,
          //           right: 0,
          //           child: SizedBox(
          //             width: context.width * 0.3,
          //             child: CustomButton.primary(text: "Find now",leading: Assets.icon.searchNormal.svg(
          //               colorFilter: ColorFilter.mode(context.color.white, BlendMode.srcIn),
          //             ), onPressed: (){
          //
          //             }),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // )

        ],
      ),
    );
  }
}
