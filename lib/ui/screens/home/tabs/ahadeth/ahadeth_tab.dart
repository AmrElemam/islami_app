import 'package:flutter/material.dart';
import '../../../../../model/details_screen_args.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/constants.dart';
import '../../../details_screen.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.asset(AppAssets.icTabAhadeth),flex: 3,),
        Divider(
          thickness: 3,
          color: AppColors.primiary,
        ),
        Text("Hadeth Name",style: AppTheme.qurantabtitletextstyle,),
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
                            SuraOrHadethName: "${index+1}الحديث رقم ",
                            FileName: "h${index+1}.txt",
                            IsQuranFile: false));
                  },
                  child: Text("${index+1}الحديث رقم",textAlign: TextAlign.center,style: AppTheme.qurantabtitletextstyle.copyWith(fontWeight: FontWeight.normal),),
                );
              },
              itemCount: 50,
            )
        )
      ],
    );
  }
}
