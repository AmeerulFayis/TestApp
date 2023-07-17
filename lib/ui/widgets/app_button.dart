
import 'package:flutter/material.dart';

import '../../util/app_color.dart';
import '../../util/app_constants.dart';
import 'app_text_view.dart';

Widget appButton(
    width,
    height,
    color,
    text,
    textColor,


{double radius=5,required final Function() onPressedAction}
    ) {
  return SizedBox(
    width: width,
    height: height,
    child: MaterialButton(
      color:color,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(radius)),
      onPressed:onPressedAction,
      child: appTextView(name:text,color: AppColor.white),),
  );
}