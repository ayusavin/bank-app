import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  colorScheme: lightColorScheme,
  textTheme: primaryTextTheme,
  chipTheme: primaryChipTheme,
  dividerColor: const Color.fromRGBO(0, 0, 0, 0.12),
  unselectedWidgetColor: const Color.fromRGBO(0, 0, 0, 0.32),
  tabBarTheme: primaryTabBarTheme,
);

TextTheme primaryTextTheme = TextTheme(
  displayMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: fontfamilies.display,
    height: 1.33,
  ),
  bodyMedium: TextStyle(
    fontFamily: fontfamilies.text,
    height: 1.25,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    letterSpacing: -0.4,
  ),
  titleLarge: TextStyle(
    fontFamily: fontfamilies.text,
    letterSpacing: -0.7,
    height: 1.2,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
  labelLarge: TextStyle(
    fontFamily: fontfamilies.text,
    letterSpacing: -0.42,
    height: 1.28571,
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: const Color.fromRGBO(0, 0, 0, 0.55),
  ),
  labelMedium: TextStyle(
    fontFamily: fontfamilies.text,
    fontSize: 14,
    letterSpacing: -0.41,
    fontWeight: FontWeight.normal,
    color: Colors.black,
    height: 1.28571,
  ),
  labelSmall: TextStyle(
    fontFamily: fontfamilies.text,
    fontSize: 14,
    letterSpacing: -0.41,
    fontWeight: FontWeight.normal,
    color: const Color.fromRGBO(0, 0, 0, 0.55),
    height: 1.28571,
  ),
);

final primaryTabBarTheme = TabBarTheme(
  dividerColor: const Color.fromRGBO(0, 0, 0, 0.12),
  indicatorSize: TabBarIndicatorSize.tab,
  unselectedLabelColor: const Color.fromRGBO(0, 0, 0, 0.55),
  indicator: const UnderlineTabIndicator(
    borderSide: BorderSide(color: Color.fromRGBO(6, 132, 65, 1), width: 2),
  ),
  labelColor: Colors.black,
  labelStyle: primaryTextTheme.bodyMedium,
  unselectedLabelStyle: primaryTextTheme.bodyMedium,
);

const ColorScheme lightColorScheme = ColorScheme.light(
  brightness: Brightness.light,
  primary: Color(0xFF08A652),
  secondary: Colors.white,
);

ChipThemeData primaryChipTheme = ChipThemeData(
  labelPadding: const EdgeInsets.symmetric(horizontal: 4),
  backgroundColor: const Color.fromRGBO(0, 0, 0, 0.08),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  ),
  side: BorderSide.none,
  selectedColor: const Color(0xFF08A652),
);

class FontFamilies {
  final String? display;
  final String? text;

  FontFamilies(this.display, this.text);
}

FontFamilies fontfamilies = FontFamilies("SF Pro Display", "SF Pro Text");
