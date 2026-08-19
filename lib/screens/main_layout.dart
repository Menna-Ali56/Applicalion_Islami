import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/app_colors.dart';
import '../models/tab_info.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int selectedIndex = 0;
  List<TabInfo> tabs = [
    TabInfo(
      iconParh: 'assets/svg/quran.svg',
      label: "Quran",
      backgroundImag: 'assets/images/home_screen.png',
      content: Container(),
    ),
    TabInfo(
      iconParh: 'assets/svg/book.svg',
      label: "Hadeeth",
      backgroundImag: 'assets/images/home_screen.png',
      content: Container(),
    ),
    TabInfo(
      iconParh: 'assets/svg/sebha.svg',
      label: "Sebha",
      backgroundImag: 'assets/images/home_screen.png',
      content: Container(),
    ),
    TabInfo(
      iconParh: 'assets/svg/radio.svg',
      label: "Radio",
      backgroundImag: 'assets/images/home_screen.png',
      content: Container(),
    ),
    TabInfo(
      iconParh: 'assets/svg/time.svg',
      label: "Time",
      backgroundImag: 'assets/images/home_screen.png',
      content: Container(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index){

          setState(() {
            selectedIndex=index;
          });

        },
        selectedIndex: selectedIndex,
        backgroundColor: AppColors.primaryColor,
        indicatorColor: AppColors.secColor.withValues(alpha: .6),
        labelTextStyle: WidgetStateProperty.all(TextStyle(color: Colors.white)),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: List.generate(
          tabs.length,
              (index) => NavigationDestination(

            icon: SvgPicture.asset(
              color:Colors.black,
              tabs[index].iconParh,
              width: 24,
              height: 24,
            ),
            label: tabs[index].label,
             selectedIcon:SvgPicture.asset(
               color:Colors.white,
               tabs[index].iconParh,
               width: 24,
               height: 24,
             ),
          ),
        ),
      ),
    );
  }
}