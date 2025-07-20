import 'package:flutter/material.dart';

class Bouncing extends StatefulWidget {
  const Bouncing({
    required this.child,
    required this.onTap,
    super.key,
    this.duration,
    this.onLongPress,
    this.enableFeedback,
  });

  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Widget? child;
  final Duration? duration;
  final bool? enableFeedback;

  @override
  State<Bouncing> createState() => _BouncingState();
}

class _BouncingState extends State<Bouncing> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isAnimating = false;

  Duration get _duration => widget.duration ?? const Duration(milliseconds: 100);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleTap() async {
    if (_isAnimating || widget.onTap == null) return;

    _isAnimating = true;
    await _controller.forward();
    await Future.delayed(_duration);
    if (mounted) {
      await _controller.reverse();
      widget.onTap?.call();
    }
    _isAnimating = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onLongPress: widget.onLongPress,
      child: Transform.scale(
        scale: _scaleAnimation.value,
        child: widget.child,
      ),
    );
  }
}