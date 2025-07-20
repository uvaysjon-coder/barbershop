import 'package:barbershop/core/themes/index.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';
import '../widgets/profile_items.dart';

class AboutProfilePage extends StatelessWidget {
  const AboutProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: AppSpacing.h16,
        child: CustomButton.primary(
          text: "Back",
          onPressed: () {
            Navigator.pop(context);
          },
        ).safeArea(),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.color.white),
        backgroundColor: context.color.primary,
        title: Text(
          'About',
          style: context.text.titleMedium?.copyWith(color: context.color.white),
        ),
      ),
      body: ColoredBox(
        color: context.color.primary,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.3,
                width: context.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [

                    Assets.icon.appIcon.svg(
                    ),
                    Assets.icon.bg.svg(
                      fit: BoxFit.cover,
                      width: context.width,
                    ),
                  ],
                ),
              ),
              Container(
                padding: AppSpacing.a16,
                decoration: BoxDecoration(
                  color: context.color.white,
                  borderRadius: AppBorders.tl20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About Gobar", style: context.text.headline4),
                    8.gap,
                    Text(
                      '''Gobar: The Best Solution for Online Barber Bookings\nWant a more practical and efficient hair shaving experience? Gobar is the best solution for you! Gobar is an online barber booking application that makes it easy for you to search, select and order haircut services easily and quickly.''',
                      style: context.text.subHeadline2?.copyWith(
                        color: context.color.coolGray500,
                      ),
                    ),
                    8.gap,
                    Text("Rate Us", style: context.text.subHeadline2?.copyWith(
                      color: context.color.coolGray500,
                    ),),
                    8.gap,
                    ProfileItems(
                       "Let’s rating this App",
          
                      onTap: () {},
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
