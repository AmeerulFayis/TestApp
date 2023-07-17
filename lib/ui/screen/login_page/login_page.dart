import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:testapp/ui/screen/mobile_verification_page/mobile_verification_page.dart';
import 'package:testapp/ui/screen/sign_up_page/sign_up_page.dart';
import 'package:testapp/ui/widgets/app_button.dart';
import 'package:testapp/ui/widgets/app_text_field.dart';
import 'package:testapp/ui/widgets/app_text_view.dart';
import 'package:testapp/util/app_constants.dart';

import '../../../auth_services.dart';
import '../../../util/app_color.dart';
import '../dash_board_page/dash_board_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController(text: "abcd@gmail.com");
  TextEditingController passwordController = TextEditingController(text: "123456");
  bool obsureText = true;

  void loginWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailController.text.toString(), password: passwordController.text.toString());
      // Login successful, you can navigate to another screen or perform any additional logic here
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DashBoardPage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {

        print('Wrong password provided.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          padding: commonPaddingAll30,
          children: [
            appTextView(
                name: "Hello!",
                color: AppColor.darkGreen,
                size: 30,
                fontWeight: FontWeight.bold),
            appTextView(
                name: "Welcome back",
                color: AppColor.darkGreen,
                size: 30,
                fontWeight: FontWeight.bold),
            divider30(),
            SizedBox(
                height: 45.0,
                child: appTextField(emailController, hintText: "Email")),
            dividerH(),
            SizedBox(
                height: 45.0,
                child: appTextField(passwordController,
                    hintText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(obsureText == true
                          ? Icons.visibility_off
                          : Icons.visibility),
                      color: AppColor.darkGreen,
                      onPressed: () {
                        setState(() {
                          obsureText = !obsureText;
                        });
                      },
                    ),
                    obscure: obsureText)),
            dividerH(),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                  child: appTextView(
                      name: "Forget Password?", color: AppColor.darkGreen)),
            ),
            dividerH(),
            Align(
                alignment: Alignment.center,
                child: appButton(
                    screenWidth(context) / 1.5,
                    45.0,
                    AppColor.darkGreen,
                    "Sign In",
                    AppColor.white, onPressedAction: () {
                      loginWithEmailAndPassword();
                })),
            Container(
                padding: commonPaddingAll,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account?',
                        style:
                            const TextStyle(color: AppColor.grey, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Sign up',
                              style: const TextStyle(
                                  color: AppColor.darkGreen, fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  // navigate to desired screen
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignUp()));
                                })
                        ]),
                  ),
                )),
            dividerH(),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Divider(
                thickness: 2,
              ),
            ),
            Container(
              padding: commonPaddingAll,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () async{
                        try{
                          await signInWithGoogle();
                        }catch(e){
                          log("errrrrrrrrrrrrrrrrror");

                        }

                      },
                      icon: const Icon(
                        Icons.g_mobiledata_outlined,
                        size: 50,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MobileVerification()));
                      },
                      icon: const Icon(
                        Icons.phone_android_outlined,
                        size: 50,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
