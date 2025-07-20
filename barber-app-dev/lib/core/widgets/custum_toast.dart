import 'package:flutter/material.dart';

class CustomToastService {
  static final CustomToastService _instance = CustomToastService._internal();
  factory CustomToastService() => _instance;
  CustomToastService._internal();

  static OverlayEntry? _currentToast;

  // Default configurations
  static const Duration _defaultDuration = Duration(seconds: 3);
  static const ToastPosition _defaultPosition = ToastPosition.bottom;
  static const ToastAnimation _defaultAnimation = ToastAnimation.fadeSlide;

  /// Show a customizable toast message
  static void _showToast(
      BuildContext context, {
        required String message,
        required ToastType type,
        Duration? duration,
        List<ToastAction>? actions,
        ToastPosition? position,
        ToastAnimation? animation,
        VoidCallback? onDismiss,
      }) {
    // Remove any existing toast first
    _currentToast?.remove();

    final overlay = Overlay.of(context);
    final screenSize = MediaQuery.of(context).size;
    final effectivePosition = position ?? _defaultPosition;
    final effectiveAnimation = animation ?? _defaultAnimation;
    final effectiveDuration = duration ?? _defaultDuration;

    // Create animated widget based on animation type
    Widget createAnimatedToast(Widget child) {
      switch (effectiveAnimation) {
        case ToastAnimation.fade:
          return AnimatedOpacityToast(child: child);
        case ToastAnimation.slide:
          return AnimatedSlideToast(
            position: effectivePosition,
            child: child,
          );
        case ToastAnimation.fadeSlide:
          return AnimatedFadeSlideToast(
            position: effectivePosition,
            child: child,
          );
        case ToastAnimation.scale:
          return AnimatedScaleToast(child: child);
        case ToastAnimation.none:
          return child;
      }
    }

    _currentToast = OverlayEntry(
      builder: (context) {
        // Position calculation
        late Positioned positionedWidget;

        switch (effectivePosition) {
          case ToastPosition.top:
            positionedWidget = Positioned(
              top: screenSize.height * 0.1,
              width: screenSize.width * 0.9,
              left: screenSize.width * 0.05,
              child: createAnimatedToast(_buildToastContent(
                message,
                type,
                actions,
                    () {
                  _currentToast?.remove();
                  _currentToast = null;
                  if (onDismiss != null) onDismiss();
                },
              )),
            );
            break;
          case ToastPosition.bottom:
            positionedWidget = Positioned(
              bottom: screenSize.height * 0.1,
              width: screenSize.width * 0.9,
              left: screenSize.width * 0.05,
              child: createAnimatedToast(_buildToastContent(
                message,
                type,
                actions,
                    () {
                  _currentToast?.remove();
                  _currentToast = null;
                  if (onDismiss != null) onDismiss();
                },
              )),
            );
            break;
          case ToastPosition.center:
            positionedWidget = Positioned(
              top: screenSize.height * 0.5 - 40,
              width: screenSize.width * 0.9,
              left: screenSize.width * 0.05,
              child: createAnimatedToast(_buildToastContent(
                message,
                type,
                actions,
                    () {
                  _currentToast?.remove();
                  _currentToast = null;
                  if (onDismiss != null) onDismiss();
                },
              )),
            );
            break;
        }

        return positionedWidget;
      },
    );

    overlay.insert(_currentToast!);

    // Auto dismiss after duration
    if (duration != Duration.zero) {
      Future.delayed(effectiveDuration, () {
        if (_currentToast?.mounted == true) {
          _currentToast?.remove();
          _currentToast = null;
          if (onDismiss != null) onDismiss();
        }
      });
    }
  }

  static Widget _buildToastContent(
      String message,
      ToastType type,
      List<ToastAction>? actions,
      VoidCallback onClose,
      ) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: type.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    type.icon,
                    color: type.iconColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onClose,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF9E9E9E),
                    size: 20,
                  ),
                ),
              ],
            ),
            if (actions != null && actions.isNotEmpty) ...[
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: actions.map((action) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ElevatedButton(
                      onPressed: () {
                        onClose();
                        action.onPressed?.call();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: action.backgroundColor ?? type.iconColor,
                        foregroundColor: action.textColor ?? Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        minimumSize: const Size(0, 32),
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      child: Text(action.label),
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }

  /// Show a success toast
  static void success(
      BuildContext context,
      String message, {
        Duration? duration,
        List<ToastAction>? actions,
        ToastPosition? position,
        ToastAnimation? animation,
        VoidCallback? onDismiss,
      }) {
    _showToast(
      context,
      message: message,
      type: ToastType.success,
      duration: duration,
      actions: actions,
      position: position,
      animation: animation,
      onDismiss: onDismiss,
    );
  }

  /// Show an error toast
  static void error(
      BuildContext context,
      String message, {
        Duration? duration,
        List<ToastAction>? actions,
        ToastPosition? position,
        ToastAnimation? animation,
        VoidCallback? onDismiss,
      }) {
    _showToast(
      context,
      message: message,
      type: ToastType.error,
      duration: duration,
      actions: actions,
      position: position,
      animation: animation,
      onDismiss: onDismiss,
    );
  }

  /// Show a warning toast
  static void warning(
      BuildContext context,
      String message, {
        Duration? duration,
        List<ToastAction>? actions,
        ToastPosition? position,
        ToastAnimation? animation,
        VoidCallback? onDismiss,
      }) {
    _showToast(
      context,
      message: message,
      type: ToastType.warning,
      duration: duration,
      actions: actions,
      position: position,
      animation: animation,
      onDismiss: onDismiss,
    );
  }

  /// Show a custom toast with your own configuration
  static void custom(
      BuildContext context,
      String message, {
        required IconData icon,
        required Color iconColor,
        required Color backgroundColor,
        Duration? duration,
        List<ToastAction>? actions,
        ToastPosition? position,
        ToastAnimation? animation,
        VoidCallback? onDismiss,
      }) {
    final customType = ToastType(
      icon: icon,
      iconColor: iconColor,
      backgroundColor: backgroundColor.withOpacity(0.1),
    );

    _showToast(
      context,
      message: message,
      type: customType,
      duration: duration,
      actions: actions,
      position: position,
      animation: animation,
      onDismiss: onDismiss,
    );
  }
}

/// Toast type configuration
class ToastType {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  const ToastType({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
  });

  static ToastType get success => const ToastType(
    icon: Icons.check,
    iconColor: Color(0xFF1ABB9C),
    backgroundColor: Color(0xFFE6F7F4),
  );

  static ToastType get error => const ToastType(
    icon: Icons.close,
    iconColor: Color(0xFFE74C3C),
    backgroundColor: Color(0xFFFDEDED),
  );

  static ToastType get warning => const ToastType(
    icon: Icons.warning,
    iconColor: Color(0xFFF39C12),
    backgroundColor: Color(0xFFFEF5E7),
  );

  static ToastType get info => const ToastType(
    icon: Icons.info_outline,
    iconColor: Color(0xFF3498DB),
    backgroundColor: Color(0xFFE9F5FE),
  );
}

/// Action button configuration for toasts
class ToastAction {
  final String label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;

  const ToastAction({
    required this.label,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
  });
}

/// Position options for toast
enum ToastPosition {
  top,
  center,
  bottom,
}

/// Animation options for toast
enum ToastAnimation {
  fade,
  slide,
  fadeSlide,
  scale,
  none,
}

// Animation implementations
class AnimatedOpacityToast extends StatefulWidget {
  final Widget child;

  const AnimatedOpacityToast({super.key, required this.child});

  @override
  State<AnimatedOpacityToast> createState() => _AnimatedOpacityToastState();
}

class _AnimatedOpacityToastState extends State<AnimatedOpacityToast> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: widget.child,
    );
  }
}

class AnimatedSlideToast extends StatefulWidget {
  final Widget child;
  final ToastPosition position;

  const AnimatedSlideToast({
    super.key,
    required this.child,
    required this.position,
  });

  @override
  State<AnimatedSlideToast> createState() => _AnimatedSlideToastState();
}

class _AnimatedSlideToastState extends State<AnimatedSlideToast> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Set slide direction based on position
    Offset beginOffset;
    switch (widget.position) {
      case ToastPosition.top:
        beginOffset = const Offset(0.0, -1.0);
        break;
      case ToastPosition.bottom:
        beginOffset = const Offset(0.0, 1.0);
        break;
      case ToastPosition.center:
        beginOffset = const Offset(0.0, -0.3);
        break;
    }

    _slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: widget.child,
    );
  }
}

class AnimatedFadeSlideToast extends StatefulWidget {
  final Widget child;
  final ToastPosition position;

  const AnimatedFadeSlideToast({
    super.key,
    required this.child,
    required this.position,
  });

  @override
  State<AnimatedFadeSlideToast> createState() => _AnimatedFadeSlideToastState();
}

class _AnimatedFadeSlideToastState extends State<AnimatedFadeSlideToast> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Set slide direction based on position
    Offset beginOffset;
    switch (widget.position) {
      case ToastPosition.top:
        beginOffset = const Offset(0.0, -0.3);
        break;
      case ToastPosition.bottom:
        beginOffset = const Offset(0.0, 0.3);
        break;
      case ToastPosition.center:
        beginOffset = const Offset(0.0, -0.2);
        break;
    }

    _slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: widget.child,
      ),
    );
  }
}

class AnimatedScaleToast extends StatefulWidget {
  final Widget child;

  const AnimatedScaleToast({super.key, required this.child});

  @override
  State<AnimatedScaleToast> createState() => _AnimatedScaleToastState();
}

class _AnimatedScaleToastState extends State<AnimatedScaleToast> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}

// Extension to make calling easier
extension ToastExtension on BuildContext {
  ToastHelper get toast => ToastHelper(this);
}

class ToastHelper {
  final BuildContext context;

  ToastHelper(this.context);

  void success(
      String message, {
        Duration? duration,
        List<ToastAction>? actions,
        ToastPosition? position,
        ToastAnimation? animation,
        VoidCallback? onDismiss,
      }) {
    CustomToastService.success(
      context,
      message,
      duration: duration,
      actions: actions,
      position: position,
      animation: animation,
      onDismiss: onDismiss,
    );
  }

  void error(
      String message, {
        Duration? duration,
        List<ToastAction>? actions,
        ToastPosition? position,
        ToastAnimation? animation,
        VoidCallback? onDismiss,
      }) {
    CustomToastService.error(
      context,
      message,
      duration: duration,
      actions: actions,
      position: position,
      animation: animation,
      onDismiss: onDismiss,
    );
  }

  void warning(
      String message, {
        Duration? duration,
        List<ToastAction>? actions,
        ToastPosition? position,
        ToastAnimation? animation,
        VoidCallback? onDismiss,
      }) {
    CustomToastService.warning(
      context,
      message,
      duration: duration,
      actions: actions,
      position: position,
      animation: animation,
      onDismiss: onDismiss,
    );
  }

  void custom(
      String message, {
        required IconData icon,
        required Color iconColor,
        required Color backgroundColor,
        Duration? duration,
        List<ToastAction>? actions,
        ToastPosition? position,
        ToastAnimation? animation,
        VoidCallback? onDismiss,
      }) {
    CustomToastService.custom(
      context,
      message,
      icon: icon,
      iconColor: iconColor,
      backgroundColor: backgroundColor,
      duration: duration,
      actions: actions,
      position: position,
      animation: animation,
      onDismiss: onDismiss,
    );
  }
}