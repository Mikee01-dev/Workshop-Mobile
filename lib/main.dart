import 'package:aplikasi_mobile/core/constants/app_constants.dart';
import 'package:aplikasi_mobile/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aplikasi_mobile/features/dashboard/presentation/pages/dashboard_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,

      /// Theme aplikasi
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      /// Mode theme
      themeMode: ThemeMode.light,

      /// Halaman pertama
      home: const DashboardPage(),
    );
  }
}
