import 'package:barbershop/core/extension/num_extension.dart';
import 'package:barbershop/core/themes/app_borders.dart';
import 'package:barbershop/core/themes/app_spacing.dart';
import 'package:barbershop/core/themes/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class ShimmerLoading extends StatefulWidget {
  final Widget child;
  final bool isLoading;

  const ShimmerLoading({
    super.key,
    required this.child,
    required this.isLoading,
  });

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _animation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutSine,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.grey.shade300,
              ],
              stops: const [0.1, 0.5, 0.9],
              begin: Alignment(_animation.value, 0),
              end: const Alignment(1, 0),
            ).createShader(bounds);
          },
          child: child,
        );
      },
    );
  }
}

class BigBarberItemShimmer extends StatelessWidget {
  const BigBarberItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.h12,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerLoading(
            isLoading: true,
            child: ClipRRect(
              borderRadius: AppBorders.r8,
              child: Container(
                height: context.height * 0.3,
                width: context.width,
                color: Colors.grey.shade300,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: context.width * 0.4,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: AppBorders.r8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          8.gap,
          ShimmerLoading(
            isLoading: true,
            child: Container(
              height: 24,
              width: context.width * 0.6,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: AppBorders.r4,
              ),
            ),
          ),
          8.gap,
          ShimmerLoading(
            isLoading: true,
            child: Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                ),
                4.gap,
                Expanded(
                  child: Container(
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: AppBorders.r4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          8.gap,
          ShimmerLoading(
            isLoading: true,
            child: Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                ),
                4.gap,
                Container(
                  height: 16,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: AppBorders.r4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BarberTopShimmer extends StatelessWidget {
  const BarberTopShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: AppSpacing.h12,
          child: ShimmerLoading(
            isLoading: true,
            child: Container(
              height: 28,
              width: context.width * 0.7,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: AppBorders.r4,
              ),
            ),
          ),
        ),
        8.gap,
        SizedBox(
          height: context.height * 0.45,
          child: PageView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const BigBarberItemShimmer();
            },
          ),
        ),
        8.gap,
        Padding(
          padding: AppSpacing.h12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShimmerLoading(
                isLoading: true,
                child: Container(
                  height: 12,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: AppBorders.r4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SmallBarberItemShimmer extends StatelessWidget {
  final bool isNight;

  const SmallBarberItemShimmer({
    super.key,
    this.isNight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.v4,
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              color: isNight ? Colors.grey.shade800 : Colors.grey.shade300,
              borderRadius: AppBorders.r8,
            ),
          ),
          8.gap,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isNight ? Colors.grey.shade800 : Colors.grey.shade300,
                    borderRadius: AppBorders.r4,
                  ),
                ),
                8.gap,
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isNight ? Colors.grey.shade800 : Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                    ),
                    4.gap,
                    Expanded(
                      child: Container(
                        height: 16,
                        decoration: BoxDecoration(
                          color: isNight ? Colors.grey.shade800 : Colors.grey.shade300,
                          borderRadius: AppBorders.r4,
                        ),
                      ),
                    ),
                  ],
                ),
                8.gap,
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isNight ? Colors.grey.shade800 : Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                    ),
                    4.gap,
                    Container(
                      height: 16,
                      width: 40,
                      decoration: BoxDecoration(
                        color: isNight ? Colors.grey.shade800 : Colors.grey.shade300,
                        borderRadius: AppBorders.r4,
                      ),
                    ),
                  ],
                ),
                8.gap,
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NearestBarberShopShimmer extends StatelessWidget {
  final bool isNight;

  const NearestBarberShopShimmer({
    super.key,
    this.isNight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.h12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 28,
            width: context.width * 0.6,
            decoration: BoxDecoration(
              color: isNight ? Colors.grey.shade800 : Colors.grey.shade300,
              borderRadius: AppBorders.r4,
            ),
          ),
          8.gap,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return ShimmerEffect(
                isNight: isNight,
                child: SmallBarberItemShimmer(isNight: isNight),
              );
            },
          ),
          8.gap,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: context.width * 0.3,
                height: 40,
                decoration: BoxDecoration(
                  color: isNight ? Colors.grey.shade800 : Colors.grey.shade300,
                  borderRadius: AppBorders.r8,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class ShimmerEffect extends StatefulWidget {
  final Widget child;
  final bool isNight;

  const ShimmerEffect({
    super.key,
    required this.child,
    this.isNight = false,
  });

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _animation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutSine,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      child: widget.child,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: widget.isNight
                  ? [
                Colors.grey.shade900,
                Colors.grey.shade700,
                Colors.grey.shade900,
              ]
                  : [
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.grey.shade300,
              ],
              stops: const [0.1, 0.5, 0.9],
              begin: Alignment(_animation.value, 0),
              end: const Alignment(1, 0),
            ).createShader(bounds);
          },
          child: child,
        );
      },
    );
  }
}

// Usage example:
// In your BarberTop widget, you can use it like this:
// @override
// Widget build(BuildContext context) {
//   return BlocBuilder<HomeBloc, HomeState>(
//     builder: (context, state) {
//       if (state.status == HomeStatus.loading) {
//         return const BarberTopShimmer();
//       }
//       return ListView(
//         // Your actual content
//       );
//     },
//   );
// }