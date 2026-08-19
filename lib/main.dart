import 'package:flutter/material.dart';
import 'package:islami/screens/main_layout.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';
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
      initialRoute:AppRoutes.mainLayoutRoute,
      routes: {
        OnBoarding.routeName: (_) => const OnBoarding(),
        AppRoutes.mainLayoutRoute:(_)=>MainLayout(),
        HomeScreen.routeName: (_) => const HomeScreen(),
      },
    );
  }
}