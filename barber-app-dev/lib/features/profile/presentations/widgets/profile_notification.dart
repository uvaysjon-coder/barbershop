

import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ProfileNotification extends StatefulWidget {
  const ProfileNotification({super.key});

  @override
  State<ProfileNotification> createState() => _ProfileNotificationState();
}

class _ProfileNotificationState extends State<ProfileNotification> {

  bool boolss = false;


  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: context.color.primary,
      value: boolss,
      onChanged: (value) {
        setState(() {
          boolss = value;
        });
      },
    );
  }
}
