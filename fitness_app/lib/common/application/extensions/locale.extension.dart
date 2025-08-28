import 'dart:ui';

extension LocaleHelpers on Locale {
  bool get isArabic => languageCode.split('_').first == 'ar';
  bool get isEnglish => languageCode.split('_').first == 'en';
}
