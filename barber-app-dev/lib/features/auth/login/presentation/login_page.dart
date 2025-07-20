import 'package:barbershop/core/themes/index.dart';
import 'package:barbershop/features/auth/login/presentation/widgets/login_listener.dart';
import 'package:barbershop/features/auth/login/presentation/widgets/user_inputs.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginListener(
        child: Stack(
          children: [
            // Background with image
            Container(
              color: context.color.secondary,
              child: Column(
                children: [
                  Image.asset(
                    Assets.img.loginBg.path,
                    fit: BoxFit.cover,
                    width: context.width,
                    height: context.height * 0.8, // Adjust this value as needed
                  ),
                ],
              ),
            ),


            // White card at the bottom
             Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Image.asset(
                    Assets.img.loginImg.path,
                    fit: BoxFit.cover,
                    height: context.height * 0.4, // Adjust as needed
                  ),
                  const UserInputs(),
                ],
              ),
            ),

            // "LOGIN" text at the top
          ],
        ),
      ),
    );
  }
}
