import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/ui/screens/details_screen.dart';
import 'package:islami_app/ui/screens/home/home_screen.dart';
import 'package:islami_app/ui/screens/splash/splash_screen.dart';
import 'package:islami_app/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => SettingsProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  late SettingsProvider provider;

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("en"), Locale("ar")],
      locale: Locale(provider.currentlocale),
      themeMode: provider.CurrentThemeMode,
      theme: AppTheme.LightTheme,
      darkTheme: AppTheme.DarkTheme,
      routes: {
        HomeScreen.routename: (_) => const HomeScreen(),
        DetailsScreen.routename: (_) => const DetailsScreen(),
        SplashScreen.routename: (_) => const SplashScreen()
      },
      initialRoute: SplashScreen.routename,
    );
  }
}
