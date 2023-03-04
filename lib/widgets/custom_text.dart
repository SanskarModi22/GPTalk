import 'package:flutter/material.dart';

enum CustomTextSize { large, medium, regular, small, tiny }

class CustomText extends StatelessWidget {
  final String text;
  final CustomTextSize size;
  final TextStyle? style;
  final TextAlign? textAlign;

  const CustomText(this.text,
      {this.size = CustomTextSize.regular,
      this.style,
      Key? key,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fontSize = _getFontSize();
    final textStyle = (style ?? const TextStyle()).copyWith(fontSize: fontSize);
    return Text(text, style: textStyle, textAlign: textAlign);
  }

  double _getFontSize() {
    switch (size) {
      case CustomTextSize.large:
        return 20;
      case CustomTextSize.medium:
        return 17.5;
      case CustomTextSize.regular:
        return 15;
      case CustomTextSize.small:
        return 12;
      case CustomTextSize.tiny:
        return 8;
    }
  }
}
