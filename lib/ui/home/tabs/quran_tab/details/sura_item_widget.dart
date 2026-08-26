import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';


import '../../../../../utils/app_text_style.dart';

class SuraItemWidget extends StatelessWidget {
  final String content;
  final int index ;
  const SuraItemWidget({super.key,required this.content,required this.index});
  

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Container(
      margin:EdgeInsets.symmetric(
        horizontal: width*0.02,
      ) ,
      padding: EdgeInsets.symmetric(
        vertical: height*0.02,
        horizontal: width*0.04

      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border:Border.all(
          color:AppColors.primaryColor,
          width:2,

        )
      ),
      child: Text('$content[${index+1}]',
       textAlign: .center,
       textDirection: TextDirection.rtl,
       style: AppTextStyle.bold20primary,
      ),
    );
  }
}
