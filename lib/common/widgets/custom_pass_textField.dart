import 'package:flutter/material.dart';
import 'package:shopping_app/units/constants/colors.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.onChanged,
    this.validator,
    this.controller,
  });

  final String label;
  final String hint;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        cursorColor: AppColors.secondary,
        onChanged: widget.onChanged,
        obscureText: obscureText,
        validator: widget.validator,
        keyboardType: TextInputType.visiblePassword,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: AppColors.kFontFamily,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15),
          hintText: widget.hint,
          hintStyle: TextStyle(
            fontSize: 14,
            fontFamily: AppColors.kFontFamily,
            color: Colors.grey.shade500,
          ),
          labelText: widget.label,
          labelStyle: TextStyle(
            fontSize: 16,
            fontFamily: AppColors.kFontFamily,
            color: Colors.grey.shade500,
          ),
          errorStyle: const TextStyle(
            fontFamily: AppColors.kFontFamily,
            color: Colors.red,
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.grey.shade400,
            size: 22,
          ),
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
            borderSide: const BorderSide(width: 1, color: Colors.red),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.2, color: Colors.red),
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Icon(obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
