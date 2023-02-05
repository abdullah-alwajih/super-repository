part of '../../super_repository.dart';

abstract class AppStorage {
  static final _local = SuperRepository.provider.local;

  // language
  static set setLocaleCode(String languageCode) =>
      _local.create(key: 'language-code', value: languageCode);

  static Locale get getLocale => Locale(_local.read(key: 'language-code') ??
      Platform.localeName.substring(0, 2));

  // Theme
  static set setThemeMode(ThemeMode mode) =>
      _local.create(key: 'theme-mode', value: mode.toString());

  static ThemeMode get getThemeMode {
    final mode = _local.read(key: 'theme-mode') ?? ThemeMode.system.toString();
    return mode == ThemeMode.dark.toString() ? ThemeMode.dark : ThemeMode.light;
  }
}