import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      (throw ArgumentError('lbl_color_initializer_error'.tr));
}

getBackgroundColor(ColorInitializer bgColor, context) {
  final colorScheme = Theme.of(context).colorScheme;
  final bgColorMap = {
    ColorInitializer.primary: colorScheme.primary,
    ColorInitializer.primaryContainer: colorScheme.primaryContainer,
    ColorInitializer.secondary: colorScheme.secondary,
    ColorInitializer.secondaryContainer: colorScheme.secondaryContainer,
    ColorInitializer.surface: colorScheme.surface,
    ColorInitializer.background: colorScheme.background,
  };
  return bgColorMap[bgColor];
}
