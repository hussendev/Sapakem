import 'dart:ui';

import 'package:equatable/equatable.dart';

class LanguageState extends Equatable {
  final Locale locale;

  const LanguageState(this.locale);

  @override
  List<Object> get props => [locale];
}

class InitialLanguage extends LanguageState {
  const InitialLanguage() : super(const Locale('en', ''));
}

class ArabicLanguage extends LanguageState {
  const ArabicLanguage() : super(const Locale('ar', ''));
}

class EnglishLanguage extends LanguageState {
  const EnglishLanguage() : super(const Locale('en', ''));
}

class HebrewLanguage extends LanguageState {
  const HebrewLanguage() : super(const Locale('he', ''));
}
