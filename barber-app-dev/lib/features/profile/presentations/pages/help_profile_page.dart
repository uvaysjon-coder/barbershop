import 'package:barbershop/core/widgets/custom_text_field.dart';

import '../../../../core/widgets/custom_button.dart';
import '/../core/themes/index.dart';
import 'package:flutter/material.dart';

class HelpProfilePage extends StatelessWidget {
  const HelpProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: AppSpacing.h16,
        child: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0,                  
          child: CustomButton.primary(
            text: "Submit",
            onPressed: () {},
          ).safeArea(),
        ),
      ),
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: Padding(
        padding: AppSpacing.h16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icon.help.svg(),
            10.gap,
            Text(
              "How we can help you today ?",
              style: context.text.headline2?.copyWith(
                color: context.color.primary,
              ),
            ),
            12.gap,
            Text(
              "Please enter your personal data and describe your care needs or something we can help you with",
              style: context.text.body3?.copyWith(
                color: context.color.primary,
              ),
            ),
            12.gap,
            const CustomTextField.primary(
              title: "Name",
              hintText: "Enter your name",
            ),
            12.gap,
            const CustomTextField.primary(
              title: "Email",
              hintText: "Enter your email",
            ),
            12.gap,
            const CustomTextField.primary(
              title: "Description",
              hintText: "Enter your description",
              maxLines: 5,
            ),
          ],
        ).singleChildScrollView(context).keyboardDismisser(),
      ),
    );
  }
}
