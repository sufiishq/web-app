import 'package:flutter/material.dart';

enum ColorInitializer {
  primary,
  primaryContainer,
  onPrimary,
  secondary,
  secondaryContainer,
  onSecondary,
  background,
  onBackground,
  surface,
  onSurface,
  onError
}

getForegroundColor(ColorInitializer bgColor, context) {
  final colorScheme = Theme.of(context).colorScheme;
  final fgColorMap = {
    ColorInitializer.primary: colorScheme.onPrimary,
    ColorInitializer.primaryContainer: colorScheme.onPrimary,
    ColorInitializer.secondary: colorScheme.onSecondary,
    ColorInitializer.secondaryContainer: colorScheme.onSecondary,
    ColorInitializer.surface: colorScheme.onSurface,
    ColorInitializer.background: colorScheme.onBackground,
  };
  return fgColorMap[bgColor] ??
      (throw ArgumentError(
          'bgColor is not a valid background color checkout ColorInitializer enum class.'));
}

getBackgroundColor(ColorInitializer bgColor, context) {
  final colorScheme = Theme.of(context).colorScheme;
  final bgColorMap = {
    ColorInitializer.primary: colorScheme.primary,
    ColorInitializer.secondary: colorScheme.secondary,
    ColorInitializer.surface: colorScheme.surface,
    ColorInitializer.background: colorScheme.background,
  };
  return bgColorMap[bgColor];
}
