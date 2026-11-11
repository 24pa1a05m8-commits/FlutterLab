import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

/// Entry point of the SheRise Flutter application.
///
/// Experiment: 6(a) – Design a Custom Women Entrepreneur Profile Card Widget
/// with Styled Text and Buttons.
/// Selected Sustainable Development Goal: SDG 5 – Gender Equality.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SheRiseApp());
}

/// Root widget of the application.
/// Configures Material 3 theming, responsive scaffolding, and navigation root.
class SheRiseApp extends StatelessWidget {
  const SheRiseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SheRise – Women Entrepreneurs',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
