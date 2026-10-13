import 'package:flutter/material.dart';

class Dice extends StatelessWidget {
  const Dice({super.key, required this.value})
      : assert(value >= 1 && value <= 6);

  final int value;

  IconData get _faceIcon {
    switch (value) {
      case 1:
        return Icons.looks_one;
      case 2:
        return Icons.looks_two;
      case 3:
        return Icons.looks_3;
      case 4:
        return Icons.looks_4;
      case 5:
        return Icons.looks_5;
      case 6:
        return Icons.looks_6;
      default:
        return Icons.looks_one;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: colorScheme.outlineVariant),
        ),
        child: Icon(
          _faceIcon,
          size: 76,
          color: colorScheme.primary,
          semanticLabel: 'Die showing $value',
        ),
      ),
    );
  }
}