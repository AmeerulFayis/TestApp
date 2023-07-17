
import 'package:flutter/cupertino.dart';

import '../../util/app_color.dart';


Widget appTextView(
    {String name = "",
    double size = 15,
    dynamic maxLines = 1,
      double height=1.5,

      Color color = AppColor.black,
      double letterSpacing=0,
      double wordSpacing=0,
      double textScaleFactor=0.9,

      FontWeight fontWeight = FontWeight.normal,
      }) {
  return Text(
    name,
    textScaleFactor: textScaleFactor,

    style:
        TextStyle(fontSize: size, fontWeight: fontWeight, color: color, letterSpacing: letterSpacing,
          wordSpacing:wordSpacing ,),
    overflow: TextOverflow.ellipsis,
    maxLines: maxLines,
  );
}
