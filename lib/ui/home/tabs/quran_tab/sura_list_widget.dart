import 'package:flutter/material.dart';


import 'package:islami/utils/assets.dart';
import 'package:islami/utils/app_routes.dart';

import '../../../../models/sura_model.dart';
import '../../../../utils/app_text_style.dart';


class SuraListWidget extends StatelessWidget {
  const SuraListWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context,index){

          return InkWell(
            onTap: (){
             Navigator.of(context).pushNamed(AppRoutes.suraDetailsRoute,
             arguments: index
             );
            },
            child: SuraItem(suraModel: SuraModel.suraList[index],),
          );
        }
        , separatorBuilder: (context,index)=>const Divider(
      color: Colors.white,
      thickness: 1,
      endIndent: 30,
      indent: 30,
      height: 20,
    ),
        itemCount: SuraModel.suraList.length
    );
  }
}
class SuraItem extends StatelessWidget {
 SuraItem({super.key,required this.suraModel});

final SuraModel suraModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: .center,
          children: [
            Image.asset(AppAssets.suraNumber,height: 60,
            width: 60,
              fit: BoxFit.fill,
              ),
            Text("${suraModel.index+1}",style: AppTextStyle.bold16white,)
          ],
        ),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: .start,
          children: [
            Text(suraModel.suraEnglishName,
            style:AppTextStyle.bold20white
            ),
            Text("${suraModel.numOfVerses} Verses",
                style:AppTextStyle.bold14white
            ),
          ],
        ),
        const Spacer(),
        Text(
          suraModel.suraArabicName,
          style: AppTextStyle.bold20white,
        )
      ],
    );
  }
}
