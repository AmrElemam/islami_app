import 'package:flutter/material.dart';
import 'package:islami_app/ui/screens/details_screen.dart';
import 'package:islami_app/ui/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routename:(_)=>HomeScreen(),
        DetailsScreen.routename:(_)=>DetailsScreen()
      },
      initialRoute: HomeScreen.routename,
      );
  }
}
