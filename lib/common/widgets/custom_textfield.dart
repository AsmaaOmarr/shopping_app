import 'package:flutter/material.dart';
import 'package:shopping_app/units/constants/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.onChanged,
    this.isObscure = false,
    required this.validator,
    required this.icon,
    this.keyboardType = TextInputType.text, this.controller,
  });

  final String label;
  final String hint;
  final Function(String)? onChanged;
  final bool isObscure;
  final String? Function(String?)? validator;
  final IconData? icon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: AppColors.secondary,
        onChanged: onChanged,
        obscureText: isObscure,
        validator: validator,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: AppColors.kFontFamily,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(16),
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 16,
            fontFamily: AppColors.kFontFamily,
            color: Colors.grey.shade500,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: AppColors.kFontFamily,
            color: Colors.grey.shade500,
          ),
          errorStyle: const TextStyle(
            fontFamily: AppColors.kFontFamily,
            color: AppColors.error,
          ),
          //default
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 0.8,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 0.8,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(width: 1, color: AppColors.secondary),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColors.error),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.2, color: AppColors.error),
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: Icon(
            icon,
            color: Colors.grey.shade400,
            size: 22,
          ),
        ),
      ),
    );
  }
}
