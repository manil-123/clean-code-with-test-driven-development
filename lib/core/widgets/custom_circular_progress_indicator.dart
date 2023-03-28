import 'package:ecom_clean_code/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.primaryDark,
        color: AppColors.primary,
      ),
    );
  }
}
