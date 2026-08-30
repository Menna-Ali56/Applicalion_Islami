import 'package:flutter/material.dart';

import 'package:islami/models/on_boarding_data_model.dart';
import 'package:islami/onBoarding/widgets/dot_indicator.dart';
import 'package:islami/onBoarding/widgets/on_boarding_page.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_colors.dart';
import '../utils/assets.dart';
import '../utils/strings.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  static const String routeName = "onBoarding-screen";

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      currentIndex = pageController.page?.toInt() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    
    
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secColor,
        body: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .stretch,
      
          children: [
            Image.asset(AppAssets.islamiHeader, height: size.height * 0.25),
            Expanded(
              child:
              PageView.builder(
                controller: pageController,
                itemCount: OnBoardingDataModel.onBoardingList.length,
                itemBuilder: ((context, index) => OnBoardingPage(
                  onBoardingDataModel: OnBoardingDataModel.onBoardingList[index],
                )),
              ),
            ),
            Stack(
              alignment: .center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
      
                      TextButton(
                        onPressed: () {
                          if (currentIndex > 0) {
                            pageController.animateToPage(
                              currentIndex - 1,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          foregroundColor: AppColors.primaryColor,
                        ),
                        child: currentIndex == 0
                            ? const SizedBox.shrink()
                            : Text(Strings.back),
                      ),
      
                      TextButton(
                        onPressed: () {
                          if (currentIndex == 4) {
                            _seenOnBoarding();
      
                            Navigator.of(context).pushReplacementNamed(
                              AppRoutes.mainLayoutRoute,
                            );
      
                            return;
                          }
      
                          pageController.animateToPage(
                            currentIndex + 1,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );
                        },
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                          foregroundColor: AppColors.primaryColor,
                        ),
                        child: Text(
                          currentIndex == 4 ? Strings.finish : Strings.next,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: .center,
                  children: List.generate(
                    OnBoardingDataModel.onBoardingList.length,
                    (index) => DotIndicator(isActive: index == currentIndex
      
      
      ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _seenOnBoarding() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('firstTime', false);
    Navigator.pushReplacementNamed(context,AppRoutes.mainLayoutRoute );

  }

}

