import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/settings/settings_tab.dart.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int CurrentTapIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    const SebhaTab(),
    const RadioTab(),
    const SettingsTab()
  ];
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(provider.isdarkmode()
                    ? AppAssets.icDarkBackground
                    : AppAssets.icBackground),
                fit: BoxFit.fill)),
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.islami),
          ),
          bottomNavigationBar: BuildBottomNavigationBar(),
          body: tabs[CurrentTapIndex],
        )
    );
  }

  Widget BuildBottomNavigationBar() => Theme(
    data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          onTap: (index) {
            CurrentTapIndex = index;
            setState(() {});
          },
          currentIndex: CurrentTapIndex,
          items: [
            const BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icQuran)), label: "Quran"),
            const BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),
                label: "Ahadeth"),
            const BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icSebha)), label: "Sebha"),
            const BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icRadio)), label: "Radio"),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings),
          ],
        ),
  );
}
