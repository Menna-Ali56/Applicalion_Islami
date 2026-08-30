import 'package:flutter/material.dart';


import 'package:islami/ui/home/home_screen.dart';
import 'package:islami/ui/home/tabs/quran_tab/details/sura_details_screen.dart';
import 'package:islami/ui/home/tabs/quran_tab/details/sura_details_screen1.dart';

import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'onBoarding/on_boarding.dart';

// Future<void> main()async  {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   var isFirstTime=prefs.getBool('firstTime') ?? true;
//   runApp( MyApp(isFirstTime: isFirstTime,));
//
// }
 void main(){
   runApp(MyApp());
 }

class MyApp extends StatelessWidget {
  // MyApp({super.key,required this.isFirstTime});
  // final bool isFirstTime ;
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute:AppRoutes.homeScreenRoute ,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: .dark,
      routes: {
        OnBoarding.routeName: (_) => const OnBoarding(),

        AppRoutes.suraDetailsRoute:(_)=>SuraDetailsScreen(),
        AppRoutes.suraDetailsRoute1:(_)=>SuraDetailsScreen1(),
        AppRoutes.homeScreenRoute:(_)=>HomeScreen(),
      },
    );
  }
}