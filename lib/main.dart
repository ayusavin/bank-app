import 'package:bank_app/ioc.dart';
import 'package:flutter/material.dart';
import 'package:bank_app/themes/themes.dart';
import 'package:bank_app/const/localization.dart';
import 'package:bank_app/widgets/profile/page.dart';

void main() {
  preRunDependenciesSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank App',
      theme: lightTheme,
      home: const ProfilePage(),
      supportedLocales: S.supportedLocales,
      locale: S.locale,
      localizationsDelegates: S.localizationDelegates,
    );
  }
}
