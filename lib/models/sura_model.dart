import 'package:islami/models/quran_resources.dart';

class SuraModel {
  String suraEnglishName;
  String suraArabicName;
  String numOfVerses;
  int index;
  SuraModel({
    required this.suraArabicName,
    required this.suraEnglishName,
    required this.numOfVerses,
    required this.index,
  });
  static List<SuraModel> suraList = List.generate(
    114,
    (index) => SuraModel(
      suraArabicName: QuranResources.arabicQuranSura[index],
      suraEnglishName: QuranResources.englishQuranSura[index],
      numOfVerses: QuranResources.ayaNumber[index],
      index: index,
    ),
  );
}
