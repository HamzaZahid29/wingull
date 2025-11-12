import 'package:flutter/material.dart';
import 'package:wingull/core/widgets/app_text_widget.dart';
import 'package:wingull/core/theme/app_text_styles.dart';

enum AppButtonSize { small, medium, large, extraLarge, fullWidth }

class AppElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final AppButtonSize size;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final bool isDisabled;

  const AppElevatedButton({
    super.key,
    required this.title,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.isDisabled = false,
  });

  double get _borderRadius {
    switch (size) {
      case AppButtonSize.small:
        return 30; // fully rounded small pill
      case AppButtonSize.medium:
        return 16;
      case AppButtonSize.large:
        return 12;
      case AppButtonSize.extraLarge:
        return 10;
      case AppButtonSize.fullWidth:
        return 12;
    }
  }

  EdgeInsets get _padding {
    switch (size) {
      case AppButtonSize.small:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
      case AppButtonSize.medium:
        return const EdgeInsets.symmetric(horizontal: 20, vertical: 12);
      case AppButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 16);
      case AppButtonSize.extraLarge:
        return const EdgeInsets.symmetric(horizontal: 28, vertical: 20);
      case AppButtonSize.fullWidth:
        return const EdgeInsets.symmetric(vertical: 16, horizontal: 16);
    }
  }

  TextStyle get _textStyle {
    switch (size) {
      case AppButtonSize.small:
        return AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.w600);
      case AppButtonSize.medium:
        return AppTextStyles.body.copyWith(fontWeight: FontWeight.w600);
      case AppButtonSize.large:
        return AppTextStyles.title.copyWith(fontWeight: FontWeight.w600);
      case AppButtonSize.extraLarge:
        return AppTextStyles.headline3.copyWith(fontWeight: FontWeight.w600);
      case AppButtonSize.fullWidth:
        return AppTextStyles.title.copyWith(fontWeight: FontWeight.w600);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color resolvedColor = backgroundColor ?? Theme.of(context).primaryColor;
    final Color resolvedTextColor = textColor ?? Colors.white;

    Widget child = AppTextWidget(
      data: title,
      textStyle: _textStyle.copyWith(color: resolvedTextColor),
      textAlign: TextAlign.center,
    );

    if (icon != null) {
      child = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child,
          size == AppButtonSize.fullWidth ? Spacer() : SizedBox(),
          Icon(icon, color: resolvedTextColor, size: _textStyle.fontSize! + 2),
        ],
      );
    }

    Widget button = ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isDisabled ? Colors.grey : resolvedColor,
        padding: _padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        elevation: 0,
      ),
      child: child,
    );

    if (size == AppButtonSize.fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }

    return button;
  }
}
