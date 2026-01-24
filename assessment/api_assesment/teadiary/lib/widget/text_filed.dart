import 'package:flutter/material.dart';
import 'package:teadiary/colors/colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final int? maxLength;
  final bool isObscure;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final String? labelText;
  final EdgeInsetsGeometry? padding;
  final String? initialValue;
  final int? maxLines;

  const AppTextField({
    super.key,
    required this.keyboardType,
    required this.hintText,
    this.controller,
    this.maxLength,
    this.isObscure = false,
    this.validator,
    this.onTap,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputAction,
    this.labelText,
    this.padding,
    this.initialValue,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      obscureText: isObscure,
      validator: validator,
      readOnly: readOnly,
      textInputAction: textInputAction,
      cursorColor: CustomColors.primaryColor,
      onTap: readOnly ? onTap : null,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        counterText: "",
        contentPadding:
            padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black87),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.primaryColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: const TextStyle(color: Colors.black),
        floatingLabelStyle: TextStyle(color: CustomColors.primaryColor),
      ),
    );
  }
}
