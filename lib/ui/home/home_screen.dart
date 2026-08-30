import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/ui/home/tabs/hadeth_tab/Hadeth_tab_content.dart';
import 'package:islami/ui/home/tabs/quran_tab/quran_tab_content.dart';
import 'package:islami/ui/home/tabs/radio_tab/radio_tab_content.dart';
import 'package:islami/ui/home/tabs/sebha_tab/sebha_tab_content.dart';
import 'package:islami/ui/home/tabs/time_tab/time_tab_content.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/assets.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex=0;
  List<Widget>tabsList=[
    QuranTabContent(),
    HadethTabContent(),
    SebhaTabContent(),
    RadioTabContent(),
    TimeTabContent()
  ];
  List <String>backgroundImages=[
  AppAssets.quranBG,
    AppAssets.hadethBG,
    AppAssets.sebhaBG,
    AppAssets.hadethBG,
    AppAssets.quranBG,


  ];

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(backgroundImages[selectedIndex],
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,),
         Scaffold(
         backgroundColor: AppColors.transparentColor,
           bottomNavigationBar: Theme(
             data: Theme.of(context).copyWith(
               canvasColor: AppColors.primaryColor,
             ),
             child: BottomNavigationBar(
               backgroundColor: AppColors.primaryColor,
                 //type: BottomNavigationBarType.fixed,
                 selectedItemColor: Colors.white,
                   unselectedItemColor: Colors.black,
                 currentIndex: selectedIndex,
                 onTap:(int index){
                 selectedIndex=index;
                 setState(() {

                 });
                 },
                 items:
             [
               builtBottomNavBarItem(icon: AppAssets.quranIcon, label: "Quran",index: 0),
               builtBottomNavBarItem(icon: AppAssets.hadethIcon, label: "Hadeth",index: 1),
               builtBottomNavBarItem(icon: AppAssets.sebhaIcon, label: "Sebha",index: 2),
               builtBottomNavBarItem(icon: AppAssets.radioIcon, label: "Radio",index: 3),
               builtBottomNavBarItem(icon: AppAssets.timeIcon, label: "Time",index: 4),




             ]),
           ),

           body:SafeArea(
             child: Column(
                 spacing: height*0.01,
                 children:[
               Image.asset(AppAssets.header),
               Expanded(child: tabsList[selectedIndex])] ),
           ) ,

         )
      ],
    );
  }

BottomNavigationBarItem builtBottomNavBarItem({ required String icon,required String label,required int index}){

    return  BottomNavigationBarItem(icon: selectedIndex ==index?

    Container(
      padding:EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6
      )
      ,decoration:BoxDecoration(
      color: AppColors.blackBgColor,
      borderRadius: BorderRadius.circular(66)


    ),
      child:
      SvgPicture.asset(icon, width: 24,
        height: 24,
        color:Colors.white,
      ),)
        :SvgPicture.asset(icon, width: 24,
      height: 24,
      color:Colors.black,)
    ,label: label);
}
}