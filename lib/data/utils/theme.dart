import 'package:flutter/material.dart';
import 'package:asalhapuja/data/utils/colors.dart';

ThemeData asalha = ThemeData(
  useMaterial3: true,
  fontFamily: 'OpenSans',
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
    primarySwatch: ThemeColors.warning,
    backgroundColor: Colors.white,
    errorColor: ThemeColors.error,
  ),
  appBarTheme: const AppBarTheme(
    color: ThemeColors.warning,
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

CardTheme cardWhiteBorder = CardTheme(
  shadowColor: Colors.white,
  elevation: 0,
  // color: Colors.white,
  surfaceTintColor: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

ElevatedButtonThemeData buttonGreen = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: ThemeColors.success.shade700,
    textStyle: const TextStyle(fontWeight: FontWeight.w500),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    disabledBackgroundColor: ThemeColors.gray.shade200,
    disabledForegroundColor: Colors.white,
  ),
);

ElevatedButtonThemeData buttonRed = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: ThemeColors.error.shade500,
    textStyle: const TextStyle(fontWeight: FontWeight.w500),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    disabledBackgroundColor: ThemeColors.gray.shade200,
    disabledForegroundColor: Colors.white,
  ),
);
ElevatedButtonThemeData buttonSuccess = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
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

ElevatedButtonThemeData buttonYellow = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    minimumSize: const Size.fromHeight(50),
    foregroundColor: Colors.white,
    backgroundColor: ThemeColors.warning.shade500,
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
    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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

TextStyle fs14fw500 = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w500,
);

TextStyle fs14fw400 = const TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

TextStyle fs14fw400Red = const TextStyle(
  color: ThemeColors.error,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

TextStyle fs14fw400Green = const TextStyle(
  color: ThemeColors.success,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

TextStyle fs16fw500 = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

TextStyle fs10gray = const TextStyle(
  fontSize: 10,
  color: Color.fromRGBO(185, 189, 199, 1),
  fontWeight: FontWeight.w400,
);

TextStyle fs12grayW500 = const TextStyle(
  fontSize: 12,
  color: Color(0xFF667085),
  fontWeight: FontWeight.w500,
);

TextStyle fs14gray = const TextStyle(
  fontSize: 14,
  color: Color(0xFF667085),
);

TextStyle fs12gray = const TextStyle(
  fontSize: 12,
  color: Color(0xFF979CA0),
);

TextStyle fs12orange = const TextStyle(
  fontSize: 12,
  color: Colors.blue,
);
