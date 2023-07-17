import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../util/app_color.dart';
import '../../../util/app_constants.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/app_text_view.dart';

class SignUp extends StatefulWidget {
   SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController=TextEditingController();

  TextEditingController passwordController=TextEditingController();
  bool obsureText=true;


  void registerWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: emailController.text.toString(), password:passwordController.text.toString());
      // Registration successful, you can navigate to another screen or perform any additional logic here
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }




  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          padding: commonPaddingAll30,
          children:  [
            appTextView(name: "Signup to",color: AppColor.darkGreen,size: 30,fontWeight: FontWeight.bold),
            appTextView(name: "Get Started",color: AppColor.darkGreen,size: 30,fontWeight: FontWeight.bold),
            divider30(),

            SizedBox(
                height: 45.0,
                child: appTextField(emailController,hintText: "Email")),
            dividerH(),
            SizedBox(
                height: 45.0,
                child: appTextField(passwordController,hintText: "Password",suffixIcon: IconButton(icon:Icon(obsureText==true?Icons.visibility_off:Icons.visibility),color: AppColor.darkGreen, onPressed: () {
                  setState(() {
                    obsureText=!obsureText;
                  });
                },),obscure: obsureText)),
            dividerH(),
            Align(
                alignment: Alignment.center,
                child: appButton(screenWidth(context)/1.5, 45.0,AppColor.darkGreen, "Sign Up", AppColor.white,onPressedAction: (){
                  registerWithEmailAndPassword();
                })),
            Container(
                padding: commonPaddingAll,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Already have an account',
                        style: const TextStyle(
                            color:AppColor.grey, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(text: ' Sign in',
                              style: const TextStyle(
                                  color: AppColor.darkGreen, fontSize: 18,fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // navigate to desired screen
                                  Navigator.pop(context);
                                }
                          )
                        ]
                    ),
                  ),
                )
            ),
            dividerH(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Divider(
                thickness:2,
              ),
            )


          ],
        ),
      ),
    );
  }
}
