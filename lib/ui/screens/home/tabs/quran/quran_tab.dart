import 'package:flutter/material.dart';
import 'package:islami_app/model/details_screen_args.dart';
import 'package:islami_app/ui/screens/details_screen.dart';
import 'package:islami_app/ui/utils/app_assets.dart';
import 'package:islami_app/ui/utils/app_colors.dart';
import 'package:islami_app/ui/utils/app_theme.dart';
import 'package:islami_app/ui/utils/constants.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(AppAssets.icTabQuran),flex: 3,),
        Divider(
          thickness: 3,
          color: AppColors.primiary,
        ),
        Text("Sura Name",style: AppTheme.qurantabtitletextstyle,),
        Divider(
          thickness: 3,
          color: AppColors.primiary,
        ),
        Expanded(
          flex: 7,
          child: ListView.builder(
            itemBuilder: (_ , index){
              return TextButton(
                onPressed: (){
                  Navigator.pushNamed(context,
                      DetailsScreen.routename,
                      arguments: DetailsScreenArgs(
                          SuraOrHadethName: Constants.SuraNames[index],
                          FileName: "${index+1}.txt",
                          IsQuranFile: true));
                },
                child: Text(Constants.SuraNames[index],textAlign: TextAlign.center,style: AppTheme.qurantabtitletextstyle.copyWith(fontWeight: FontWeight.normal),),
              );
            },
            itemCount: Constants.SuraNames.length,
            )
        )
      ],
    );
  }
}
