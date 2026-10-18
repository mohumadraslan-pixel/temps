import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Library',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFD1664A),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F2ED),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF4F2ED),
          foregroundColor: Color(0xFF20252B),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}