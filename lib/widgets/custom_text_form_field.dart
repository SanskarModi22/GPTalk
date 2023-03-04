import 'package:flutter/material.dart';
import 'custom_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(String) onChanged;
  final TextInputType textInputType;
  final String? initialValue;
  final TextEditingController? controller;
  final bool autofocus;
  final bool? enabled;
  final int? maxLines;
  final int? minLines;
  final Color fillColor;
  final Widget? prefixIcon;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.onChanged,
    this.textInputType = TextInputType.text,
    this.initialValue,
    this.controller,
    this.enabled,
    this.autofocus = false,
    this.maxLines,
    this.fillColor = CustomColors.secondary,
    this.prefixIcon,
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      onChanged: onChanged,
      initialValue: initialValue,
      controller: controller,
      autofocus: autofocus,
      enabled: enabled,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.all(12),
        hintText: hintText,
        hintStyle: const TextStyle(color: CustomColors.lightText),
        isDense: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
