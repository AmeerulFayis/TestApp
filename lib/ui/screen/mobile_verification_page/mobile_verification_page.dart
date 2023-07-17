import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:testapp/ui/widgets/app_button.dart';
import 'package:testapp/ui/widgets/app_text_field.dart';
import 'package:testapp/ui/widgets/app_text_view.dart';
import 'package:testapp/util/app_color.dart';
import 'package:testapp/util/app_constants.dart';

class MobileVerification extends StatelessWidget {
   MobileVerification({Key? key}) : super(key: key);
  TextEditingController phoneController=TextEditingController();
  final _formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Padding(
               padding:commonPaddingAll15,
               child: TextFormField(
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please enter a number';
                   }else if(value!.length<10){
                     return 'Enter a valid number';
                   }
                 },
                maxLength: 10,
                 controller: phoneController,
                 keyboardType: TextInputType.phone,
                 textInputAction: TextInputAction.done,
                 decoration: InputDecoration(

                     prefixText: "+91  ",
                     prefixStyle: TextStyle(color: AppColor.black),
                     hintText: "Enter Your Phone Number",
                     hintStyle: TextStyle(color: AppColor.grey,fontSize: 15),
                     filled: true,
                     fillColor: Colors.grey.shade100,
                     border: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white),
                         borderRadius: BorderRadius.circular(25)
                     )
                 ),
               )
             ),
              dividerH(),
              appButton(150.0, 45.0, AppColor.darkGreen, "Get Otp", AppColor.white,radius: 50,onPressedAction: (){
                if(_formKey.currentState!.validate()){
                  log("message========");
                }


              })

            ],
          ),
        ),
      ),
    );
  }
}
