import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../model/details_screen_args.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../details_screen.dart';

class AhadethTab extends StatelessWidget {
  late SettingsProvider provider;

  AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Image.asset(AppAssets.icTabAhadeth),
        ),
        const Divider(),
        Text(AppLocalizations.of(context)!.hadethName),
        const Divider(),
        Expanded(
            flex: 7,
            child: ListView.builder(
              itemBuilder: (_, index) {
                return TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, DetailsScreen.routename,
                        arguments: DetailsScreenArgs(
                            SuraOrHadethName: "${index + 1}الحديث رقم ",
                            FileName: "h${index + 1}.txt",
                            IsQuranFile: false));
                  },
                  child: Text("${index + 1}الحديث رقم",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: provider.isdarkmode()
                              ? AppColors.white
                              : AppColors.accent)),
                );
              },
              itemCount: 50,
            )
        )
      ],
    );
  }
}
