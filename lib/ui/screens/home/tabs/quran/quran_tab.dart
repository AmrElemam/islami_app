import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/model/details_screen_args.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:islami_app/ui/screens/details_screen.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/constants.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  QuranTab({super.key});

  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(AppAssets.icTabQuran),
        ),
        const Divider(),
        Text(AppLocalizations.of(context)!.suraName),
        const Divider(),
        Expanded(
            flex: 7,
            child: ListView.builder(
              itemBuilder: (_, index) {
                return TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DetailsScreen.routename,
                        arguments: DetailsScreenArgs(
                            SuraOrHadethName: Constants.SuraNames[index],
                            FileName: "${index + 1}.txt",
                            IsQuranFile: true));
                  },
                  child: Text(
                    Constants.SuraNames[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: provider.isdarkmode()
                            ? AppColors.white
                            : AppColors.accent),
                  ),
                );
              },
              itemCount: Constants.SuraNames.length,
            )
        )
      ],
    );
  }
}
