import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/model/details_screen_args.dart';
import 'package:islami_app/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../utils/app_assets.dart';

class DetailsScreen extends StatefulWidget {
  static const String routename = "detailscreen";

  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArgs arguments;
  late SettingsProvider provider;
  String filecontent = "";

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if (filecontent.isEmpty) readfile();
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(provider.isdarkmode()
                    ? AppAssets.icDarkBackground
                    : AppAssets.icBackground),
                fit: BoxFit.fill)),
        child: Scaffold(
            appBar: AppBar(
              title: Text(arguments.SuraOrHadethName),
            ),
            body: filecontent.isEmpty? const Center(child: CircularProgressIndicator()):
            Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Text(
                        filecontent,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))
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
