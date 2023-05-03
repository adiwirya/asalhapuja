import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:asalhapuja/data/utils/colors.dart';

ThemeData asalha = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.openSans().fontFamily,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: ThemeColors.gray.shade900, fontSize: 16),
    bodyMedium: TextStyle(color: ThemeColors.gray.shade900, fontSize: 12),
    bodySmall: TextStyle(color: ThemeColors.gray.shade900, fontSize: 10),
    displayLarge: TextStyle(color: ThemeColors.gray.shade900),
    displayMedium: TextStyle(color: ThemeColors.gray.shade900),
    displaySmall: TextStyle(color: ThemeColors.gray.shade900),
    headlineLarge: TextStyle(color: ThemeColors.gray.shade900),
    headlineMedium: TextStyle(color: ThemeColors.gray.shade900),
    headlineSmall: TextStyle(color: ThemeColors.gray.shade900),
    labelLarge: TextStyle(color: ThemeColors.gray.shade900, fontSize: 12),
    labelMedium: TextStyle(color: ThemeColors.gray.shade900, fontSize: 12),
    labelSmall: TextStyle(color: ThemeColors.gray.shade900, fontSize: 12),
    titleLarge: TextStyle(color: ThemeColors.gray.shade900),
    titleMedium: TextStyle(color: ThemeColors.gray.shade900),
    titleSmall: TextStyle(color: ThemeColors.gray.shade900),
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    backgroundColor: Colors.white,
    errorColor: ThemeColors.error,
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
);

CardTheme cardGrey = CardTheme(
  surfaceTintColor: ThemeColors.gray.shade50,
  color: ThemeColors.gray.shade50,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

CardTheme cardOrange = CardTheme(
  elevation: 5,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
  color: Colors.blue.shade50,
  surfaceTintColor: Colors.blue.shade50,
);

CardTheme cardWhiteBorder = CardTheme(
  shadowColor: Colors.white,
  elevation: 0,
  // color: Colors.white,
  surfaceTintColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: BorderSide(
      color: Colors.blue.shade100,
      width: 2,
    ),
  ),
);

ElevatedButtonThemeData buttonGreen = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(50),
    foregroundColor: Colors.white,
    backgroundColor: ThemeColors.success.shade500,
    textStyle: const TextStyle(fontWeight: FontWeight.w500),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    disabledBackgroundColor: ThemeColors.gray.shade200,
    disabledForegroundColor: Colors.white,
  ),
);

ElevatedButtonThemeData buttonGray = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(50),
    foregroundColor: Colors.white,
    backgroundColor: ThemeColors.gray.shade200,
    textStyle: const TextStyle(
      fontWeight: FontWeight.w500,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);

ElevatedButtonThemeData buttonWhiteRedBorder = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(50),
    foregroundColor: ThemeColors.error,
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    textStyle: const TextStyle(
      fontWeight: FontWeight.w500,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: const BorderSide(
        color: ThemeColors.error,
      ),
    ),
  ),
);

TextStyle fs14fw600Red = const TextStyle(
  color: ThemeColors.error,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);
TextStyle fs14fw600Green = const TextStyle(
  color: ThemeColors.success,
  fontSize: 14,
  fontWeight: FontWeight.w600,
);
TextStyle fs14fw600 = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

TextStyle fs12gray = const TextStyle(
  fontSize: 12,
  color: ThemeColors.gray,
);

TextStyle fs12orange = const TextStyle(
  fontSize: 12,
  color: Colors.blue,
);
