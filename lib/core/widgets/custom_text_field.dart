import 'package:ecom_clean_code/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final bool? enabled;
  final bool? obsecure;
  final IconData? suffixIcon;
  final Function()? onSufficIconPress;

  const CustomTextFormField({
    Key? key,
    this.controller,
    this.labelText,
    this.keyboardType,
    this.validator,
    this.readOnly,
    this.enabled,
    this.obsecure,
    this.suffixIcon,
    this.onSufficIconPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.name,
      readOnly: readOnly ?? false,
      enabled: enabled ?? true,
      obscureText: obsecure ?? false,
      style: TextStyle(fontSize: 16),
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        suffixIcon: suffixIcon != null
            ? IconButton(
                onPressed: onSufficIconPress,
                icon: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Icon(
                    suffixIcon,
                    size: 20.0,
                    color: AppColors.primaryDark,
                  ),
                ),
              )
            : null,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 0, // Set minimum width to zero
          minHeight: 0, // Set minimum height to zero
        ),
        labelStyle: TextStyle(
          color: Colors.black.withOpacity(0.85),
          fontSize: 14,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
