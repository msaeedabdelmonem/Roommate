// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalization {
  AppLocalization();

  static AppLocalization? _current;

  static AppLocalization get current {
    assert(_current != null,
        'No instance of AppLocalization was loaded. Try to initialize the AppLocalization delegate before accessing AppLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalization();
      AppLocalization._current = instance;

      return instance;
    });
  }

  static AppLocalization of(BuildContext context) {
    final instance = AppLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalization present in the widget tree. Did you add AppLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalization? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  /// `Roommate`
  String get appName {
    return Intl.message(
      'Roommate',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Rooms For Rent & Roommate Finder`
  String get loginTitle {
    return Intl.message(
      'Rooms For Rent & Roommate Finder',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Browse hundreds of profiles, search and contact potential roommates for free.`
  String get loginDesc {
    return Intl.message(
      'Browse hundreds of profiles, search and contact potential roommates for free.',
      name: 'loginDesc',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get facebook_login {
    return Intl.message(
      'Continue with Facebook',
      name: 'facebook_login',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get google_login {
    return Intl.message(
      'Continue with Google',
      name: 'google_login',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Apple ID`
  String get appleLogin {
    return Intl.message(
      'Continue with Apple ID',
      name: 'appleLogin',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Rate the App`
  String get rate {
    return Intl.message(
      'Rate the App',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `Contact The Owner`
  String get contact {
    return Intl.message(
      'Contact The Owner',
      name: 'contact',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
