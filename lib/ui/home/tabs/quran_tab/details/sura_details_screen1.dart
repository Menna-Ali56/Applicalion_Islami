import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/home/tabs/quran_tab/details/sura_contant_widget.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/models/quran_resources.dart';
import 'package:islami/utils/assets.dart';
import '../../../../../utils/app_text_style.dart';


class SuraDetailsScreen1 extends StatefulWidget {
  SuraDetailsScreen1({super.key});

  @override
  State<SuraDetailsScreen1> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen1> {
  String verses = '';

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
            spacing: height * 0.02,
            children: [
              SizedBox(height: height*0.001,),
              Text(
                QuranResources.arabicQuranSura[index],
                style: AppTextStyle.bold24primary,
              ),
              SizedBox(height: height*0.02,),
              Expanded(
                child: verses.isEmpty
                    ? Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                )
                    : SingleChildScrollView(
                  child: SuraContentWidget(
                    content: verses,
                  ),
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
    for(int i =0;i<lines.length;i++){
      lines[i]+='[${i+1}]';
    }
   verses=lines.join(' ');
    await Future.delayed(Duration(seconds: 1),()=>
        setState(() {

        }),
    );

  }
}
