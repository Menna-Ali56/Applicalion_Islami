import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/models/on_boarding_data_model.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key,required this.onBoardingDataModel});
  OnBoardingDataModel onBoardingDataModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 24,
      children: [
        Expanded(child: Image.asset(onBoardingDataModel.imagePath)),

        Text(
          onBoardingDataModel.title,
          textAlign: .center,
          style: TextStyle(fontSize: 24,fontWeight: .bold,color:AppColors.primaryColor),
        ),

        if(onBoardingDataModel.description !=null)
        Text(
          onBoardingDataModel.description!,
          textAlign: .center,
          style: TextStyle(fontSize: 24,fontWeight: .bold,color:AppColors.primaryColor),
        ),
        SizedBox(height: 24,)
      ],
    );
  }
}
