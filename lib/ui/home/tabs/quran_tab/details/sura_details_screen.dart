import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/tabs/quran_tab/details/sura_item_widget.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/models/quran_resources.dart';
import '../../../../../utils/app_text_style.dart';
import '../../../../../utils/assets.dart';


class SuraDetailsScreen extends StatefulWidget {
  SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    int index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadSuraFile(index);
    }

    return Scaffold(
      backgroundColor: AppColors.secColor,
      appBar: AppBar(
        backgroundColor: AppColors.secColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text(
          QuranResources.arabicQuranSura[index],
          style: AppTextStyle.bold20primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .04),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit:BoxFit.fill ,
                  image:AssetImage(AppAssets.souraDetailsBg,
                  ))
          ),
          child: Column(
            spacing: height * 0.04,

            children: [
              SizedBox(height: height*0.001,),
              Text(
                QuranResources.arabicQuranSura[index],
                style: AppTextStyle.bold24primary,
              ),

              Expanded(
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return SuraItemWidget(
                            content: verses[index],
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: height * 0.02);
                        },

                        itemCount: verses.length,
                      ),
              ),
              SizedBox(height: height*0.06,)
            ],
          ),
        ),
      ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/quran/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    verses = lines;
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }
}
