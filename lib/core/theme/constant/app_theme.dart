import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.white,
      primaryColor: const Color(0xFF756EF3),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFF3580FF), width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
        floatingLabelStyle: const TextStyle(
          color: Color(0xFF3580FF),
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
          fontSize: 12.0,
        ),
      ),
      textTheme: const TextTheme(
        labelSmall: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        labelLarge: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
        displaySmall: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        displayMedium: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        displayLarge: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
        bodySmall: TextStyle(
          color: Colors.black54,
          fontSize: 12,
        ),
        bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: Colors.black,
      primaryColor: const Color(0xFF3580FF),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[700]!, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: Colors.grey[700]!, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Color(0xFF3580FF), width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: const TextStyle(
          color: Colors.white70,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
        ),
        floatingLabelStyle: const TextStyle(
          color: Color(0xFF3580FF),
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontSize: 12.0,
        ),
      ),
      textTheme: const TextTheme(
        labelSmall: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        labelLarge: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
        displaySmall: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        displayMedium: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        displayLarge: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
        bodySmall: TextStyle(
          color: Colors.white70,
          fontSize: 12,
        ),
        bodyMedium: TextStyle(
          color: Colors.white70,
          fontSize: 14,
        ),
        bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
