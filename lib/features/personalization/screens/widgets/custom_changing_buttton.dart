import 'package:flutter/material.dart';
import 'package:shopping_app/units/constants/colors.dart';


class CustomColorChangingButton extends StatelessWidget {
  const CustomColorChangingButton({
    super.key,
    required this.isButtonEnabled,
    required this.onPressed,
  });

  final bool isButtonEnabled;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360,
      height: 54,
      child: ElevatedButton(
        onPressed: isButtonEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          backgroundColor: isButtonEnabled ? AppColors.primary : Colors.grey,
        ),
        child: Text(
          "Save",
          style: TextStyle(
            fontSize: 18,
            color: isButtonEnabled
                ? Colors.white
                : const Color.fromARGB(255, 64, 64, 64),
            fontWeight: FontWeight.bold,
            fontFamily: AppColors.kFontFamily,
          ),
        ),
      ),
    );
  }
}
