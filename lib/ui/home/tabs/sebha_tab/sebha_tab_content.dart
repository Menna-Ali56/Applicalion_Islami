import 'package:flutter/material.dart';
import 'package:islami/utils/app_text_style.dart';
import 'package:islami/utils/assets.dart';
import '../../../../utils/strings.dart';

class SebhaTabContent extends StatefulWidget {
  const SebhaTabContent({super.key});

  @override
  State<SebhaTabContent> createState() => _SebhaTabContentState();
}

class _SebhaTabContentState extends State<SebhaTabContent> {
  final List<String> tasbehList = [
    "سبحان الله",
    "الحمدلله",
    "الله أكبر",
    "استغفر الله",
    "لا إله إلا الله",
  ];

  int counter = 0;
  int tasbehIndex = 0;
  String tasbehTitle = "سبحان الله";
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Text(Strings.zekrHeader, style: AppTextStyle.bold36white),
        const SizedBox(height: 8),
        Expanded(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Row(),
              Image.asset(AppAssets.sebhaHead, height: height * 0.1),
              Positioned.fill(
                top: height * 0.09,
                child: Stack(
                  children: [
                    AnimatedRotation(
                      turns: turns,
                      duration: const Duration(milliseconds: 200),
                      child: InkWell(
                        onTap: _updateTasbeh,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        overlayColor: WidgetStateProperty.all(
                          Colors.transparent,
                        ),
                        child: Image.asset(
                          AppAssets.sebhaBody,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(),
                        Text(tasbehTitle, style: AppTextStyle.bold36white),
                        const SizedBox(height: 16),
                        Text(
                          counter.toString(),
                          style: AppTextStyle.bold36white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _updateTasbeh() {
    setState(() {
      counter++;
      turns += 1 / 33;

      if (counter == 33) {
        tasbehIndex = (tasbehIndex + 1) % tasbehList.length;
        tasbehTitle = tasbehList[tasbehIndex];
        counter = 0;
      }
    });
  }
}
