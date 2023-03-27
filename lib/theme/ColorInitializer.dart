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
  switch (bgColor) {
    case ColorInitializer.primary:
    case ColorInitializer.primaryContainer:
      return Theme.of(context).colorScheme.onPrimary;
    case ColorInitializer.secondary:
    case ColorInitializer.secondaryContainer:
      return Theme.of(context).colorScheme.onSecondary;
    case ColorInitializer.surface:
      return Theme.of(context).colorScheme.onSurface;
    case ColorInitializer.background:
      return Theme.of(context).colorScheme.onBackground;
    default:
      return Theme.of(context).colorScheme.onBackground;
  }
}

getBackgroundColor(ColorInitializer bgColor, context) {
  switch (bgColor) {
    case ColorInitializer.primary:
      return Theme.of(context).colorScheme.primary;
    case ColorInitializer.secondary:
      return Theme.of(context).colorScheme.secondary;
    case ColorInitializer.surface:
      return Theme.of(context).colorScheme.surface;
    case ColorInitializer.background:
      return Theme.of(context).colorScheme.background;
    default:
      return Theme.of(context).colorScheme.background;
  }
}

validateBackground(ColorInitializer bgColor) {
  switch (bgColor) {
    case ColorInitializer.primary:
    case ColorInitializer.primaryContainer:
    case ColorInitializer.secondary:
    case ColorInitializer.secondaryContainer:
    case ColorInitializer.surface:
    case ColorInitializer.background:
      return ThemeData().colorScheme.background;
    default:
      return ThemeData().colorScheme.background;
  }
}
