import 'dart:math';

import 'package:flutter/material.dart';

import 'dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF54C7B5),
      brightness: Brightness.dark,
    );

    return MaterialApp(
      title: 'Dice Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: colorScheme,
        scaffoldBackgroundColor: const Color(0xFF111923),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF111923),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(52),
            side: const BorderSide(color: Color(0xFF75818F)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: const DiceScreen(),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  final Random _random = Random();

  int _firstDie = 1;
  int _secondDie = 1;
  int _total = 2;
  bool _isWin = false;

  void _rollDice() {
    setState(() {
      _firstDie = _random.nextInt(6) + 1;
      _secondDie = _random.nextInt(6) + 1;
      _total = _firstDie + _secondDie;
      _isWin = _total >= 10;
    });
  }

  void _resetGame() {
    setState(() {
      _firstDie = 1;
      _secondDie = 1;
      _total = 2;
      _isWin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.casino_outlined),
        title: const Text('Dice Game'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Total: $_total',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        _isWin ? 'assets/happy.png' : 'assets/sad.png',
                        width: 240,
                        height: 190,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _isWin ? 'You Win' : 'You Lose',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: _isWin
                                  ? colorScheme.primary
                                  : colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: Dice(value: _firstDie)),
                  const SizedBox(width: 20),
                  Expanded(child: Dice(value: _secondDie)),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  Expanded(
                    child: FilledButton.icon(
                      onPressed: _rollDice,
                      icon: const Icon(Icons.casino_outlined),
                      label: const Text('Roll Dice'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: _resetGame,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Reset'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}