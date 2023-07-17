
import 'package:flutter/material.dart';

import '../../util/app_color.dart';


Widget appTextField (
    TextEditingController controller,


    {
      Widget suffixIcon=const SizedBox(),
      String prefixText="",
      double size = 14,
      TextInputType inputType = TextInputType.name,
      TextInputAction inputAction = TextInputAction.done,
     int maxLines=1,
      String hintText="",
      double radius=5,
      bool obscure=false,
    }){
  return TextFormField(
    obscureText: obscure,
    maxLines: maxLines,
    controller: controller,
    keyboardType: inputType,
    textInputAction: inputAction,
    decoration: InputDecoration(

     /* enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none ,
      errorBorder: InputBorder.none ,
      focusedBorder: InputBorder.none ,*/
      prefixText: prefixText,

      prefixStyle: TextStyle(color: AppColor.black),
      suffixIcon:suffixIcon ,
        hintText: hintText,
        hintStyle: TextStyle(color: AppColor.grey,fontSize: size),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(radius)
        )
    ),
  );
}
