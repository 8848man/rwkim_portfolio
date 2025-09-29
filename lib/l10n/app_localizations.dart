import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ko.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ko')
  ];

  /// No description provided for @index.
  ///
  /// In en, this message translates to:
  /// **'index'**
  String get index;

  /// No description provided for @creater.
  ///
  /// In en, this message translates to:
  /// **'Creator : RWKim'**
  String get creater;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get aboutMe;

  /// No description provided for @skill.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skill;

  /// No description provided for @tendency.
  ///
  /// In en, this message translates to:
  /// **'Tendency'**
  String get tendency;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @appealPoint.
  ///
  /// In en, this message translates to:
  /// **'AppealPoint as Dev'**
  String get appealPoint;

  /// No description provided for @createdBy.
  ///
  /// In en, this message translates to:
  /// **'Created By RWKim'**
  String get createdBy;

  /// No description provided for @amFirstSectionUpperString.
  ///
  /// In en, this message translates to:
  /// **'Specialist of State Management'**
  String get amFirstSectionUpperString;

  /// No description provided for @amFirstSectionLowerString.
  ///
  /// In en, this message translates to:
  /// **'Obsessed on Architecture'**
  String get amFirstSectionLowerString;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'NAME : RAKWON KIM'**
  String get name;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'EMAIL : 8848man@naver.com'**
  String get email;

  /// No description provided for @bloodType.
  ///
  /// In en, this message translates to:
  /// **'BLOODTYPE : AB'**
  String get bloodType;

  /// No description provided for @mbti.
  ///
  /// In en, this message translates to:
  /// **'MBTI : INTP'**
  String get mbti;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'BIRTHDATE : 1996 - 04 - 23'**
  String get birthDate;

  /// No description provided for @hobby.
  ///
  /// In en, this message translates to:
  /// **'HOBBY : GAME, READ BOOKS, CODING, BOXING ... etc'**
  String get hobby;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'Education : Bucheon University'**
  String get education;

  /// No description provided for @major.
  ///
  /// In en, this message translates to:
  /// **'Major : Electronics'**
  String get major;

  /// No description provided for @qualifications.
  ///
  /// In en, this message translates to:
  /// **'Qualifications : Industrial Engineer Information Processing'**
  String get qualifications;

  /// No description provided for @award.
  ///
  /// In en, this message translates to:
  /// **'Award : PLC In-school competition'**
  String get award;

  /// No description provided for @information.
  ///
  /// In en, this message translates to:
  /// **'info'**
  String get information;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experience;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ko'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ko': return AppLocalizationsKo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
