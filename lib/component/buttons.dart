import 'package:flutter/material.dart';

import '../theme/app_color.dart';

enum KutukuButtonVariant { solid, outlined, text }

enum KutukuButtonSize { sm, md, lg }

class KutukuButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final KutukuButtonVariant variant;
  final KutukuButtonSize size;
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final double iconSize;
  final double borderRadius;
  final double? width;
  final Gradient? customGradient;

  const KutukuButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.variant = KutukuButtonVariant.solid,
    this.size = KutukuButtonSize.md,
    this.leadingIcon,
    this.trailingIcon,
    this.iconSize = 20,
    this.borderRadius = 12,
    this.width,
    this.customGradient,
  });

  EdgeInsets get _padding {
    switch (size) {
      case KutukuButtonSize.sm:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 10);
      case KutukuButtonSize.lg:
        return const EdgeInsets.symmetric(horizontal: 28, vertical: 18);
      case KutukuButtonSize.md:
      default:
        return const EdgeInsets.symmetric(horizontal: 24, vertical: 14);
    }
  }

  double get _fontSize {
    switch (size) {
      case KutukuButtonSize.sm:
        return 14;
      case KutukuButtonSize.lg:
        return 18;
      case KutukuButtonSize.md:
      default:
        return 16;
    }
  }

  Color _baseColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark ? AppColors.primaryDark : AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    final baseColor = _baseColor(context);

    final backgroundColor = switch (variant) {
      KutukuButtonVariant.solid => null, // handled via gradient
      KutukuButtonVariant.outlined => Colors.transparent,
      KutukuButtonVariant.text => Colors.transparent,
    };

    final borderColor = switch (variant) {
      KutukuButtonVariant.outlined => baseColor,
      KutukuButtonVariant.text => Colors.transparent,
      KutukuButtonVariant.solid => Colors.transparent,
    };

    final textColor = switch (variant) {
      KutukuButtonVariant.text => baseColor,
      KutukuButtonVariant.outlined => baseColor,
      KutukuButtonVariant.solid => Colors.white,
    };

    final child =
        isLoading
            ? SizedBox(
              width: iconSize,
              height: iconSize,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(textColor),
              ),
            )
            : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leadingIcon != null) ...[
                  Icon(leadingIcon, size: iconSize, color: textColor),
                  const SizedBox(width: 6),
                ],
                Flexible(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: _fontSize,
                      fontWeight: FontWeight.w600,
                      color: textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (trailingIcon != null) ...[
                  const SizedBox(width: 6),
                  Icon(trailingIcon, size: iconSize, color: textColor),
                ],
              ],
            );

    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient:
            (variant == KutukuButtonVariant.solid && customGradient != null)
                ? customGradient
                : null,
        color:
            (variant == KutukuButtonVariant.solid && customGradient == null)
                ? baseColor
                : backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor, width: 1.5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: isLoading ? null : onPressed,
          child: Padding(padding: _padding, child: Center(child: child)),
        ),
      ),
    );
  }
}
