import 'package:flutter/material.dart';

enum KutukuTextStyle {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

enum KutukuFontWeight { regular, medium, semibold, bold }

enum KutukuTextEmphasis { high, medium, disabled }

class KutukuText extends StatelessWidget {
  final String text;
  final KutukuTextStyle style;
  final KutukuFontWeight weight;
  final KutukuTextEmphasis emphasis;
  final Color? color;
  final TextAlign? align;
  final int? maxLines;
  final double? height;
  final TextOverflow overflow;
  final TextDecoration? decoration;
  final Gradient? gradient;

  const KutukuText({
    super.key,
    required this.text,
    this.style = KutukuTextStyle.bodyMedium,
    this.weight = KutukuFontWeight.regular,
    this.emphasis = KutukuTextEmphasis.high,
    this.color,
    this.align,
    this.maxLines,
    this.height,
    this.overflow = TextOverflow.ellipsis,
    this.decoration,
    this.gradient,
  });

  TextStyle _resolveStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final Map<KutukuTextStyle, TextStyle?> styleMap = {
      KutukuTextStyle.displayLarge: textTheme.displayLarge,
      KutukuTextStyle.displayMedium: textTheme.displayMedium,
      KutukuTextStyle.displaySmall: textTheme.displaySmall,
      KutukuTextStyle.headlineLarge: textTheme.headlineLarge,
      KutukuTextStyle.headlineMedium: textTheme.headlineMedium,
      KutukuTextStyle.headlineSmall: textTheme.headlineSmall,
      KutukuTextStyle.titleLarge: textTheme.titleLarge,
      KutukuTextStyle.titleMedium: textTheme.titleMedium,
      KutukuTextStyle.titleSmall: textTheme.titleSmall,
      KutukuTextStyle.bodyLarge: textTheme.bodyLarge,
      KutukuTextStyle.bodyMedium: textTheme.bodyMedium,
      KutukuTextStyle.bodySmall: textTheme.bodySmall,
      KutukuTextStyle.labelLarge: textTheme.labelLarge,
      KutukuTextStyle.labelMedium: textTheme.labelMedium,
      KutukuTextStyle.labelSmall: textTheme.labelSmall,
    };

    double opacity = switch (emphasis) {
      KutukuTextEmphasis.high => 1.0,
      KutukuTextEmphasis.medium => 0.7,

      KutukuTextEmphasis.disabled => 0.4,
    };

    FontWeight resolvedWeight = switch (weight) {
      KutukuFontWeight.medium => FontWeight.w500,
      KutukuFontWeight.semibold => FontWeight.w600,
      KutukuFontWeight.bold => FontWeight.w700,
      KutukuFontWeight.regular => FontWeight.w400,
    };

    final baseStyle = styleMap[style] ?? const TextStyle(fontSize: 16);

    return baseStyle.copyWith(
      fontWeight: resolvedWeight,
      color:
          gradient == null
              ? (color ?? baseStyle.color)?.withOpacity(opacity)
              : null,
      decoration: decoration,
      height: height,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      style: _resolveStyle(context),
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
    );

    if (gradient != null) {
      return ShaderMask(
        shaderCallback:
            (bounds) => gradient!.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
        blendMode: BlendMode.srcIn,
        child: textWidget,
      );
    }

    return textWidget;
  }
}
