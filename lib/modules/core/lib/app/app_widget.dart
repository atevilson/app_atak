
import 'package:commons/commons.dart';
import 'package:commons_dependencies/commons_dependencies.dart';
import 'package:core/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(ModularApp(module: AppModule(), child:  MyApp()));
}

void setupLocator() {
  GetIt.I.registerLazySingleton<AppLocalizations>(() => _getLocaleInstance());
}

AppLocalizations _getLocaleInstance() {
  Locale currentLocale = WidgetsBinding.instance.platformDispatcher.locale;
  switch (currentLocale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
    default:
      return AppLocalizationsEn(); 
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchProvider(),
      child: MaterialApp.router(
        routerDelegate: Modular.routerDelegate,
        routeInformationParser: Modular.routeInformationParser,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('pt'),
        ],
      ),
    );
  }
}