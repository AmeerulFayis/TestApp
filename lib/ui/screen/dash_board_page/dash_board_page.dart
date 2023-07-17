
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../util/app_color.dart';
import '../../../util/app_constants.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/app_text_view.dart';
import '../person_details_page/person_details_page.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  TextEditingController nameController=TextEditingController();
  TextEditingController ageController=TextEditingController();

  ImagePicker imagePicker=ImagePicker();
  File _selectedImage=File("");



  openCamera() async {
    try{
      final XFile? selectedImages = await imagePicker.pickImage(source: ImageSource.camera);
      final img = File(selectedImages!.path);
      setState(() {
        _selectedImage=img;
      });
      Navigator.pop(context);
    }catch(e){
      Navigator.pop(context);
    }
  }

  openGallery() async {
    try{
      final XFile? selectedImages = await imagePicker.pickImage(source: ImageSource.gallery);
      final img = File(selectedImages!.path);
      setState(() {
        _selectedImage=img;
      });
      Navigator.pop(context);
    }catch(e){
      Navigator.pop(context);
    }
  }

  DatabaseReference ref = FirebaseDatabase.instance.ref("Persons");

  void addUserData(
      String Name, String Age,) {
    var productRef =
    ref.child(Name);
    productRef.set({
      'Name': Name,
      'Age': Age,
    });
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: ListView(
        padding: commonPaddingAll30,
        children: [
          appTextView(name: "Hello!",color: AppColor.darkGreen,size: 30,fontWeight: FontWeight.bold),
          appTextView(name: "Welcome back",color: AppColor.darkGreen,size: 30,fontWeight: FontWeight.bold),
          divider30(),
          
           Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: (){

                showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: appTextView(name: "Select Image From",color: AppColor.darkGreen),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title:appTextView(name: "Camera",color: AppColor.darkGreen) ,
                            leading: Icon(Icons.camera_alt_rounded,color: AppColor.darkGreen,),
                            onTap: (){
                              openCamera();
                            },
                          ),
                          ListTile(
                            title:appTextView(name: "Gallery",color: AppColor.darkGreen) ,
                            leading: Icon(Icons.image,color: AppColor.darkGreen,),
                            onTap: (){
                              openGallery();
                            },

                          )


                        ],
                      ),
                    );

                  },
                );
              },
              child: CircleAvatar(
                backgroundImage:_selectedImage.path.isNotEmpty?FileImage(_selectedImage):NetworkImage("https://i.pinimg.com/564x/e2/be/f3/e2bef346ae5be671b272a9f102629762.jpg") as ImageProvider,
                radius: 100,
                backgroundColor: AppColor.darkGreen,
                child: Visibility(
                    visible:_selectedImage.path.isNotEmpty?false:true,
                    child: Icon(Icons.camera_alt,color: AppColor.white,size: 50,)),

              ),
            ),
          ),

          dividerH(),
          SizedBox(
              height: 45.0,
              child: appTextField(nameController,hintText: "Name")),
          dividerH(),
          SizedBox(
              height: 45.0,
              child: appTextField(ageController,hintText: "Age",),),
          dividerH(),
          Align(
              alignment: Alignment.center,
              child: appButton(screenWidth(context)/1.5, 45.0,AppColor.darkGreen, "Save", AppColor.white,onPressedAction: (){
               addUserData(nameController.text, ageController.text);
              })),
          divider30(),

          appButton(40.0, 50.0, AppColor.darkGreen, "Show Details", AppColor.white, onPressedAction: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PersonDetails()));
          })


        ],
      )),

    );
  }
}
