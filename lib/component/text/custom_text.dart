
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

class CustomText extends StatelessWidget {
  final TextType type;
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final double? textScaleFactor;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? lineHeight;

  const CustomText(
      {super.key,
      required this.text,
      this.type = TextType.body1,
      this.style,
      this.maxLines,
      this.textAlign,
      this.textScaleFactor,
      this.textDirection,
      this.overflow,
      this.letterSpacing,
      this.lineHeight});

  static double getFixedFontSize(double targetPxSize, BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double scaleFactor = width / 430; // Get device DPI
    if (scaleFactor > 1) {
      scaleFactor = 1;
    }
    return targetPxSize * scaleFactor; // Normalize font size
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      text,
      style: _getStyle(context, textTheme)!.merge(style).copyWith(
          fontSize: getFixedFontSize(style?.fontSize ?? 16, context),
          letterSpacing:letterSpacing,
              
          height: lineHeight),
      maxLines: maxLines,
      textAlign: textAlign,
      textScaler: TextScaler.noScaling,
      // textScaleFactor != null ? TextScaler.linear(textScaleFactor!) : null,
      textDirection: textDirection,
      overflow: overflow,
    );
  }

  TextStyle? _getStyle(BuildContext context, TextTheme textTheme) {
    switch (type) {
      case TextType.h1:
        return textTheme.headlineLarge;
      case TextType.h2:
        return textTheme.headlineMedium;
      case TextType.h3:
        return textTheme.headlineSmall;
      case TextType.h4:
        return textTheme.titleLarge;
      case TextType.subtitle1:
        return textTheme.titleMedium;
      case TextType.subtitle2:
        return textTheme.titleSmall;
      case TextType.body1:
        return textTheme.bodyLarge;
      case TextType.body2:
        return textTheme.bodyMedium;
      case TextType.caption:
        return textTheme.bodySmall;
      case TextType.overline:
        return textTheme.labelSmall;
    }
  }
}

enum TextType {
  h1,
  h2,
  h3,
  h4,
  subtitle1,
  subtitle2,
  body1,
  body2,
  caption,
  overline
}
