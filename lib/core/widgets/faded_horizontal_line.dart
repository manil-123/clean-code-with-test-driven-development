import 'package:ecom_clean_code/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FadedHorizontalLine extends StatelessWidget {
  const FadedHorizontalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              AppColors.primaryDark,
              Colors.white,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
      ),
    );
  }
}
