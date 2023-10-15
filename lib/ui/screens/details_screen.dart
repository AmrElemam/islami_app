import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/details_screen_args.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_theme.dart';

class DetailsScreen extends StatefulWidget {
  static const String routename = "detailscreen";


  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late  DetailsScreenArgs arguments;

  String filecontent = "";
  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if(filecontent.isEmpty) readfile();
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppAssets.icBackground),
                fit: BoxFit.fill)
        ),
        child:  Scaffold(
          appBar: AppBar(
            title:  Text(arguments.SuraOrHadethName,style: AppTheme.appbartitlestyle,),
            centerTitle: true,
            backgroundColor: AppColors.transparent,
            elevation: 0,
          ),
          backgroundColor: AppColors.transparent,
          body: filecontent.isEmpty? const Center(child: CircularProgressIndicator()):
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                child: Text(
                  filecontent,textDirection: TextDirection.rtl,textAlign: TextAlign.center,
                  style: const TextStyle(color: AppColors.accent,fontSize: 24),)),
          ),
        )
    );
  }

  void readfile() async {
    String file  = await rootBundle.loadString(arguments.IsQuranFile ?
    "assets/files/quran/${arguments.FileName}" : "assets/files/ahadeth/${arguments.FileName}");
    filecontent = file;
    List <String> filelines = filecontent.split("\n");
    for(int i = 0; i<filelines.length ; i++){
      filelines[i] += arguments.IsQuranFile ? "(${i+1})" : " ";
    }
    filecontent = filelines.join();
    setState(() {});
  }
}
