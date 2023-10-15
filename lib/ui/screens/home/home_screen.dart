import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_app/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int CurrentTapIndex = 0;
  List <Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
        BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.icBackground),
                fit: BoxFit.fill)
        ),
        child:  Scaffold(
          appBar: AppBar(
            title: const Text("Islami",style: AppTheme.appbartitlestyle,),
            centerTitle: true,
            backgroundColor: AppColors.transparent,
            elevation: 0,
          ),
          backgroundColor: AppColors.transparent,
          bottomNavigationBar: BuildBottomNavigationBar(),
          body: tabs[CurrentTapIndex],
        )
    );
  }

  Widget BuildBottomNavigationBar() => Theme(
    data: ThemeData(canvasColor: AppColors.primiary),
    child: BottomNavigationBar(
      onTap: (index){
        CurrentTapIndex = index;
        setState((){});
      },
      currentIndex: CurrentTapIndex,
      selectedItemColor: AppColors.accent,
      iconSize: 32,
      items:  const [
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icQuran)),label: "Quran"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),label: "Ahadeth"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icSebha)),label: "Sebha"),
        BottomNavigationBarItem(icon: ImageIcon(AssetImage(AppAssets.icRadio)),label: "Radio"),
      ],
    ),
  );
}
