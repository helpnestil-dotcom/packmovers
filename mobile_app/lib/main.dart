import 'package:flutter/material.dart';

import 'screens/splash_screen.dart';
import 'theme.dart';

void main() {
  runApp(const PackMoversApp());
}

class PackMoversApp extends StatelessWidget {
  const PackMoversApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PackMovers',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const SplashScreen(),
    );
  }
}
