import 'package:flutter/material.dart';

import 'custom_colors.dart';
import 'custom_text.dart';

@immutable
class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool isLoading;
  final bool fullWidth;
  final String? loadingText;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
    this.fullWidth = false,
    this.loadingText,
  }) : super(key: key);

  Widget _renderButton() {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      child: isLoading
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
                if (loadingText != null)
                  Container(
                    margin: const EdgeInsets.only(left: 16),
                    child: CustomText(
                      loadingText!,
                      size: CustomTextSize.medium,
                      style: const TextStyle(color: CustomColors.darkText),
                    ),
                  )
                else
                  const SizedBox(width: 0, height: 0),
              ],
            )
          : CustomText(
              text,
              size: CustomTextSize.medium,
              style: const TextStyle(color: CustomColors.darkText),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return fullWidth
        ? SizedBox(
            height: 40,
            width: double.infinity,
            child: _renderButton(),
          )
        : _renderButton();
  }
}
