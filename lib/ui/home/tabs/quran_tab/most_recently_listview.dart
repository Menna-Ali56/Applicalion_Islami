import 'package:flutter/material.dart';

import 'package:islami/utils/assets.dart';

import '../../../../models/quran_resources.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_text_style.dart';

class MostRecentlyListview extends StatelessWidget {
 MostRecentlyListview({super.key,required this.mostRecent});

  final List<int>mostRecent;
  @override
  Widget build(BuildContext context) {

    if(mostRecent.isEmpty){
      return SizedBox(
        height: MediaQuery.of(context).size.height*.04,
        child:Center(
          child:Text(
            "There is no most recent sura",
            style: AppTextStyle.bold20white,

          ),
        ),
      );
    }
   return SizedBox(
    height: MediaQuery.of(context).size.height*.16,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
        physics: PageScrollPhysics(),
        itemBuilder: (context,index){
       // return MostRecentlyItem(suraIndex: mostRecent[]);
        }, separatorBuilder: (context,index)=>SizedBox()
        , itemCount: mostRecent.length),
   ) ;
  }
}

class MostRecentlyItem extends StatelessWidget {
 MostRecentlyItem({super.key,required this.suraIndex});

  final int suraIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
        color :AppColors.primaryColor,
        borderRadius: .circular(20),
      ),
      child: Row(children: [
        Column(
          mainAxisAlignment: .spaceEvenly,
          crossAxisAlignment: .start,
          children: [
            Text(QuranResources.englishQuranSura[suraIndex],
            style: AppTextStyle.bold24black,),
            Text(QuranResources.arabicQuranSura[suraIndex],
              style: AppTextStyle.bold24black,),
            Text(
              "${QuranResources.ayaNumber[suraIndex]}",
              style: AppTextStyle.bold14black,),
          ],
        ),
        const SizedBox(width:12),
        Image.asset(AppAssets.mostRecent),
      ],),
    );
  }
}

