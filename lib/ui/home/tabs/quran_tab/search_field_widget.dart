import 'package:flutter/material.dart';

import 'package:islami/utils/assets.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_style.dart';


class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primaryColor,
      style: AppTextStyle.bold20white,
      decoration:
      InputDecoration(
          prefixIcon: Image.asset(AppAssets.searchIcon),
          hintText: "Sura Name",
          hintStyle: AppTextStyle.bold16white,

          enabledBorder: builtTextFieldDecoration(),
          focusedBorder: builtTextFieldDecoration(),




      )
    );
  }
  OutlineInputBorder builtTextFieldDecoration(){
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColors.primaryColor,width: 2),
    );
  }
}


