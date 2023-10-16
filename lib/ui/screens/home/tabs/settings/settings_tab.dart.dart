import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool arswitch = false;
  bool darkModeSwitch = false;
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.settings),
          BuildSettingsRow("العربيه", arswitch, (newvalue) {
            arswitch = newvalue;
            if (arswitch) {
              provider.setCurrentLocale("ar");
            } else {
              provider.setCurrentLocale("en");
            }
          }),
          BuildSettingsRow(
              AppLocalizations.of(context)!.darkMode, darkModeSwitch,
              (newvalue) {
            darkModeSwitch = newvalue;
            if (darkModeSwitch) {
              provider.setCurrentThemeMode(ThemeMode.dark);
            } else {
              provider.setCurrentThemeMode(ThemeMode.light);
            }
          }),
        ],
      ),
    );
  }

  Widget BuildSettingsRow(
      String title, bool switchvalue, Function(bool) OnChanged) {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Text(title),
        const Spacer(),
        Switch(value: switchvalue, onChanged: OnChanged)
      ],
    );
  }
}
