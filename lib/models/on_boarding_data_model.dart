import 'package:islami/core/assets.dart';

import '../core/strings.dart';

class OnBoardingDataModel{
  String imagePath;
  String title;
  String? description;


  OnBoardingDataModel({
    required this.imagePath,
    required this.title,
    this.description,
  });


  static List<OnBoardingDataModel>onBoardingList=[
    OnBoardingDataModel(imagePath: AppAssets.onBording1, title: Strings.onBording1Title),
    OnBoardingDataModel(imagePath: AppAssets.onBording2, title: Strings.onBording2Title,description: Strings.onBoarding2Description),
    OnBoardingDataModel(imagePath: AppAssets.onBording3, title: Strings.onBording3Title,description: Strings.onBoarding3Description),
    OnBoardingDataModel(imagePath: AppAssets.onBording4, title: Strings.onBording4Title,description: Strings.onBoarding4Description),
    OnBoardingDataModel(imagePath: AppAssets.onBording5, title: Strings.onBording5Title,description: Strings.onBoarding5Description),
  ];
}