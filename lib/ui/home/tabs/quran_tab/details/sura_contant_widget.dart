import 'package:flutter/material.dart';

import '../../../../../utils/app_text_style.dart';

class SuraContentWidget extends StatefulWidget {
  final String content;

  const SuraContentWidget({super.key,required this.content});

  @override
  State<SuraContentWidget> createState() => _SuraContentWidgetState();
}

class _SuraContentWidgetState extends State<SuraContentWidget> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Text(widget.content,
      textAlign: .center,
      textDirection: TextDirection.rtl,
      style: AppTextStyle.bold20primary,
    );
  }
}
