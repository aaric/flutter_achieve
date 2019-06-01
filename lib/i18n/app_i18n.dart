/// 本地化
///
/// @author Aaric, created on 2019-06-01T22:50.
/// @since 1.1.0-SNAPSHOT
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class ApplicationLocalizations {

  final Locale locale;

  ApplicationLocalizations(this.locale);

  final Map<String, Map<String, String>> _localizedValues = {
    'zh': {
      'text.app.title': '仿微信聊天',
      'text.chat': '聊天',
      'text.open.browser': '打开浏览器访问网页',
      'text.switch.language': 'Swith Language',
    },
    'en': {
      'text.app.title': 'WebChat',
      'text.chat': 'Chat',
      'text.open.browser': 'Open Browser',
      'text.switch.language': 'Swith Language',
    },
  };

  static ApplicationLocalizations of(BuildContext context) => Localizations.of(context, ApplicationLocalizations);

  get textAppTitle => _localizedValues[locale.languageCode]['text.app.title'];

  get textChat => _localizedValues[locale.languageCode]['text.chat'];

  get textOpenBrowser => _localizedValues[locale.languageCode]['text.open.browser'];

  get textSwitchLanguage => _localizedValues[locale.languageCode]['text.switch.language'];
}

class ApplicationLocalizationsDelegate extends LocalizationsDelegate<ApplicationLocalizations> {

  static ApplicationLocalizationsDelegate delegate = const ApplicationLocalizationsDelegate();

  const ApplicationLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['zh', 'en'].contains(locale.languageCode);
  }

  @override
  Future<ApplicationLocalizations> load(Locale locale) {
    return SynchronousFuture<ApplicationLocalizations>(ApplicationLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<ApplicationLocalizations> old) {
    return false;
  }

}
