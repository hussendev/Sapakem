import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sapakem/cubit/language/language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const InitialLanguage());

  void changeLanguage(String language) {
    if (language == 'ar') {
      emit(const ArabicLanguage());
    } else if (language == 'en') {
      emit(const EnglishLanguage());
    } else if (language == 'he') {
      emit(const HebrewLanguage());
    }
  }
}
