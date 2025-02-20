import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../utils/preferences_utils.dart';
import 'app_theme.dart';

final themesProvider = StateNotifierProvider<ThemesProvider, ThemeMode?>((_) {
  return ThemesProvider(false);
});

class ThemesProvider extends StateNotifier<ThemeMode?> {
  ThemesProvider(bool isDarkMode) : super(isDarkMode ? ThemeMode.dark : ThemeMode.light);

  // state is ThemeMode.system. So we need to update it by using changeTheme.
  Future<void> changeTheme(bool isOn) async {
    state = isOn ? ThemeMode.dark : ThemeMode.light;
    await PreferencesUtils.saveBool(key: PrefKeys.IS_DARK_MODE, value: isOn);
  }
}

final themeColorsProvider = Provider<ThemeColors>((ref) {
  final themeMode = ref.watch(themesProvider);
  if (themeMode == ThemeMode.dark) {
    return ThemeColors.dark();
  }
  return ThemeColors.light();
});
