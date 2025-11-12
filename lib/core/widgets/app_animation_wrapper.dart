import 'package:flutter/material.dart';

enum AppAnimationType {
  appearFromBottom,
  appearFromTop,
  appearFromLeftToRight,
  appearFromRightToLeft,
  fadeIn,
}

class AppAnimationWrapper extends StatelessWidget {
  final Widget child;
  final AppAnimationType animationType;
  final Duration duration;
  final Curve curve;
  final double offset;

  const AppAnimationWrapper({
    super.key,
    required this.child,
    this.animationType = AppAnimationType.appearFromBottom,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOut,
    this.offset = 0.1,
  });

  Offset _getBeginOffset() {
    switch (animationType) {
      case AppAnimationType.appearFromBottom:
        return Offset(0, offset);
      case AppAnimationType.appearFromTop:
        return Offset(0, -offset);
      case AppAnimationType.appearFromLeftToRight:
        return Offset(-offset, 0);
      case AppAnimationType.appearFromRightToLeft:
        return Offset(offset, 0);
      case AppAnimationType.fadeIn:
        return Offset.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    final beginOffset = _getBeginOffset();

    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: beginOffset, end: Offset.zero),
      duration: duration,
      curve: curve,
      builder: (context, value, childWidget) {
        double opacity = 1.0;
        if (animationType != AppAnimationType.fadeIn) {
          opacity = 1 - (value.dx.abs() + value.dy.abs()) / offset;
        } else {
          opacity = 1.0;
        }

        return Transform.translate(
          offset: Offset(
            value.dx * MediaQuery.of(context).size.width,
            value.dy * MediaQuery.of(context).size.height,
          ),
          child: Opacity(opacity: opacity.clamp(0.0, 1.0), child: childWidget),
        );
      },
      child: child,
    );
  }
}
