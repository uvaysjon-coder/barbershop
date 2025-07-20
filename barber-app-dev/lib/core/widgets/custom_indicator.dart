import 'package:barbershop/core/themes/index.dart';
import 'package:flutter/material.dart';

class AnimatedCustomIndicator extends StatefulWidget {
  final int count;
  final int currentIndex;
  final Duration duration;
  final bool Function()? isRtl;

  const AnimatedCustomIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    this.duration = const Duration(milliseconds: 300),
    this.isRtl,
  });

  @override
  State<AnimatedCustomIndicator> createState() => _AnimatedCustomIndicatorState();
}

class _AnimatedCustomIndicatorState extends State<AnimatedCustomIndicator> {
  late int previousIndex;

  @override
  void initState() {
    super.initState();
    previousIndex = widget.currentIndex;
  }

  @override
  void didUpdateWidget(AnimatedCustomIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentIndex != widget.currentIndex) {
      previousIndex = oldWidget.currentIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isRightToLeft = widget.isRtl?.call() ??
        widget.currentIndex > previousIndex;

    return SizedBox(
      height: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget.count,
              (index) {
            return AnimatedContainer(
              margin: AppSpacing.h4,
              duration: widget.duration,
              curve: Curves.easeInExpo,
              width: index == widget.currentIndex ? 28 : 8,
              height: 8,
              /*decoration: BoxDecoration(
                color: index == widget.currentIndex
                    ? context.color.primary
                    : context.color.unSelected,
                shape: BoxShape.circle,
              ),*/
              child:DecoratedBox(
                decoration: BoxDecoration(
                  color: index == widget.currentIndex
                      ? context.color.primary
                      : context.color.unSelected,
                  borderRadius: BorderRadius.circular(8),


                ),

              )
              /* index == widget.currentIndex ? TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: widget.duration,
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return Stack(
                    children: [
                      // Animatsiya effekti
                      Positioned(
                        left: isRightToLeft ? (28 * (1 - value)) : 0,
                        right: isRightToLeft ? 0 : (28 * (1 - value)),
                        top: 0,
                        bottom: 0,
                        child: Container(
                          width: 28 * value,
                          height: 8,
                          decoration: BoxDecoration(
                            color: context.color.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ) : null,*/
            );
          },
        ),
      ),
    );
  }
}

// Ishlatish usuli
class IndicatorUsageExample extends StatefulWidget {
  const IndicatorUsageExample({super.key});

  @override
  State<IndicatorUsageExample> createState() => _IndicatorUsageExampleState();
}

class _IndicatorUsageExampleState extends State<IndicatorUsageExample> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // PageView yoki boshqa widget

          // Indicator
          AnimatedCustomIndicator(
            count: 5,
            currentIndex: _currentIndex,
            // O'ngdan chapga uchun: isRtl: () => false
            // Chapdan o'ngga uchun: isRtl: () => true
          ),

          // Test uchun knopkalar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _currentIndex > 0
                    ? () => setState(() => _currentIndex--)
                    : null,
                child: const Text('Oldingi'),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: _currentIndex < 4
                    ? () => setState(() => _currentIndex++)
                    : null,
                child: const Text('Keyingi'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}