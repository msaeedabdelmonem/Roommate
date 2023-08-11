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

  /// `Roomates`
  String get appName {
    return Intl.message(
      'Roomates',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Rooms For Rent & Roommate Finder`
  String get loginTitle1 {
    return Intl.message(
      'Rooms For Rent & Roommate Finder',
      name: 'loginTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Browse hundreds of profiles, search and contact potential roommates for free.`
  String get loginDesc1 {
    return Intl.message(
      'Browse hundreds of profiles, search and contact potential roommates for free.',
      name: 'loginDesc1',
      desc: '',
      args: [],
    );
  }

  /// `Looking For An Ideal Roommate?`
  String get loginTitle2 {
    return Intl.message(
      'Looking For An Ideal Roommate?',
      name: 'loginTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Browse hundreds of profiles, search and contact potential roommates for free.`
  String get loginDesc2 {
    return Intl.message(
      'Browse hundreds of profiles, search and contact potential roommates for free.',
      name: 'loginDesc2',
      desc: '',
      args: [],
    );
  }

  /// `Move to your roome easly now`
  String get loginTitle3 {
    return Intl.message(
      'Move to your roome easly now',
      name: 'loginTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Browse hundreds of profiles, search and contact potential roommates for free.`
  String get loginDesc3 {
    return Intl.message(
      'Browse hundreds of profiles, search and contact potential roommates for free.',
      name: 'loginDesc3',
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

  /// `Search for rooms`
  String get search {
    return Intl.message(
      'Search for rooms',
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

  /// `Price`
  String get price {
    return Intl.message(
      'Price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Type`
  String get type {
    return Intl.message(
      'Type',
      name: 'type',
      desc: '',
      args: [],
    );
  }

  /// `I’m looking for`
  String get lookingFor {
    return Intl.message(
      'I’m looking for',
      name: 'lookingFor',
      desc: '',
      args: [],
    );
  }

  /// `List your room`
  String get listRooms {
    return Intl.message(
      'List your room',
      name: 'listRooms',
      desc: '',
      args: [],
    );
  }

  /// `Room preferences`
  String get roomPref {
    return Intl.message(
      'Room preferences',
      name: 'roomPref',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get soon {
    return Intl.message(
      'Coming Soon',
      name: 'soon',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get langName {
    return Intl.message(
      'English',
      name: 'langName',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `App ver. {number}`
  String version(Object number) {
    return Intl.message(
      'App ver. $number',
      name: 'version',
      desc: '',
      args: [number],
    );
  }

  /// `{number} Search results`
  String searchResults(Object number) {
    return Intl.message(
      '$number Search results',
      name: 'searchResults',
      desc: '',
      args: [number],
    );
  }

  /// `Choose type`
  String get chooseType {
    return Intl.message(
      'Choose type',
      name: 'chooseType',
      desc: '',
      args: [],
    );
  }

  /// `Choose City & Area`
  String get chooseLocation {
    return Intl.message(
      'Choose City & Area',
      name: 'chooseLocation',
      desc: '',
      args: [],
    );
  }

  /// `Choose price range`
  String get choosePrice {
    return Intl.message(
      'Choose price range',
      name: 'choosePrice',
      desc: '',
      args: [],
    );
  }

  /// `Entire apartment`
  String get entireRoom {
    return Intl.message(
      'Entire apartment',
      name: 'entireRoom',
      desc: '',
      args: [],
    );
  }

  /// `Signle room`
  String get single {
    return Intl.message(
      'Signle room',
      name: 'single',
      desc: '',
      args: [],
    );
  }

  /// `Double room`
  String get double {
    return Intl.message(
      'Double room',
      name: 'double',
      desc: '',
      args: [],
    );
  }

  /// `Tribble room`
  String get tribble {
    return Intl.message(
      'Tribble room',
      name: 'tribble',
      desc: '',
      args: [],
    );
  }

  /// `It’s Free`
  String get free {
    return Intl.message(
      'It’s Free',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `You are invited to book this room {room}`
  String share(Object room) {
    return Intl.message(
      'You are invited to book this room $room',
      name: 'share',
      desc: '',
      args: [room],
    );
  }

  /// ` in `
  String get inWord {
    return Intl.message(
      ' in ',
      name: 'inWord',
      desc: '',
      args: [],
    );
  }

  /// `per month`
  String get perMonth {
    return Intl.message(
      'per month',
      name: 'perMonth',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `No available rooms yet`
  String get noData {
    return Intl.message(
      'No available rooms yet',
      name: 'noData',
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
