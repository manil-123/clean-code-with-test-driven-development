import 'package:ecom_clean_code/app/theme/app_colors.dart';
import 'package:ecom_clean_code/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get lightTheme => ThemeData(
      // primarySwatch: MaterialColor(0XFF598DF2, color),
      primaryColor: AppColors.primary,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primaryDark,
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 252, 252, 252),
        ),
      ),
      fontFamily: 'Poppins',
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blueDark,
          padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 16.0),
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 34.0, vertical: 16.0),
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
        ),
      ),
      textTheme: TextTheme(
        headline1: GoogleFonts.poppins(
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0XFF598DF2),
        ),
        headline2: GoogleFonts.poppins(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0XFF000000),
        ),
        headline3: GoogleFonts.poppins(
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        headline4: GoogleFonts.poppins(
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        headline5: GoogleFonts.poppins(
          fontSize: 12.0.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0XFF000000),
        ),
        headline6: GoogleFonts.poppins(
          fontSize: 12.0.sp,
          fontWeight: FontWeight.w400,
          color: const Color(0XFF000000),
        ),
      ),
    );
