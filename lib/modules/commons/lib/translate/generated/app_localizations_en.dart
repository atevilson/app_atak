import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appBarTitleHome => 'Atak research app';

  @override
  String get titleInputLabelHome => 'Google search';

  @override
  String get titleBottomHome => 'Search';

  @override
  String get msgErrorSearchProvider => 'search error';
}
