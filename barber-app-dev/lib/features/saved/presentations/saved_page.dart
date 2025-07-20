import 'dart:ui';

import 'package:barbershop/core/themes/index.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chat',

        style: context.textTheme.titleMedium?.copyWith(
          color: context.color.white
        ),),
        backgroundColor: context.color.primary,
      ),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [

          Image.asset(
            Assets.img.chatsDemo.path,
            fit: BoxFit.fill,
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
        ],
      )
    );
  }
}



