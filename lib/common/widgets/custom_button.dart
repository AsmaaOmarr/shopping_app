import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_app/units/constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.buttonName, required this.onPressed});

  final String buttonName;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 360,
        height: 54,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            //shape: const StadiumBorder(),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: AppColors.primary,
            elevation: 2, // Add a shadow with elevation
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                buttonName,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppColors.kFontFamily,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
