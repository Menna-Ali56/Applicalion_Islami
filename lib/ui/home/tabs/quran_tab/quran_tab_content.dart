import 'package:flutter/material.dart';
import 'package:islami/ui/home/tabs/quran_tab/search_field_widget.dart';
import '../../../../utils/app_text_style.dart';
import 'most_recently_listview.dart';
import 'sura_list_widget.dart';

class QuranTabContent extends StatelessWidget {
  const QuranTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .04),
      child: Column(
        crossAxisAlignment: .start,
        spacing: height * .01,
        children: [
          SearchField(),
          Text(
            "Most Recently",
            style: AppTextStyle.bold16white,
          ),

          MostRecentlyListview(mostRecent: List.generate(3, (i)=>1)),

          Text(
            "Sura List",
            style: AppTextStyle.bold16white,
          ),

          Expanded(child: SuraListWidget()),
        ],
      ),
    );
  }
}
