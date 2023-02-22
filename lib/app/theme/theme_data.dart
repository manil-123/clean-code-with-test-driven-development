import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get lightTheme => ThemeData(
      // primarySwatch: MaterialColor(0XFF598DF2, color),
      primaryColor: Color(0XFF598DF2),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0XFF598DF2),
        foregroundColor: Colors.white,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w700,
          color: Color.fromARGB(255, 252, 252, 252),
        ),
      ),
      fontFamily: 'Poppins',
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
