import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zapchat/res/constants.dart' as appConsts;
import 'package:zapchat/res/colors.dart' as appColors;
import 'package:zapchat/res/styles.dart';
import 'package:zapchat/res/reusable_widgets.dart' as appReusable;
import 'package:zapchat/login_screen.dart';
import 'package:zapchat/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class registerScreen extends StatefulWidget {
  static const registerScreenID = 'reg';
  const registerScreen({super.key});

  @override
  State<registerScreen> createState() => _registerScreenState();
}

class _registerScreenState extends State<registerScreen>
    with SingleTickerProviderStateMixin {

  bool showLoading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  //to create custom animation first we have to create AnimationController object
  late AnimationController controller;
  late Animation animation;
  @override
  void initState() {

    //then we have to initialise the object and pass duration and vsync
    controller = AnimationController(
        duration: appConsts.animationTiming, vsync: this);
    //we also need to pass controller as a parent and a curve type
    animation = CurvedAnimation(parent: controller, curve: Curves.ease);
    //this specifies the direction of the animation
    controller.forward();
    //listner is essential as it will listen to the changes in the animation
    animation.addListener(() {
      //we have to use setState so we can update UI on every change in controller
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ModalProgressHUD(

        inAsyncCall: showLoading,
        child: ModalProgressHUD(
          progressIndicator: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(appColors.purple)),
          inAsyncCall: showLoading,
          child: Padding(
            padding: EdgeInsets.all(28.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        'assets/login.png',
                        height: animation.value * 200,
                      ),
                      Text(
                        "Register Your Account",
                        style: lowTextStyle,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(

                        keyboardType: TextInputType.emailAddress,
                        decoration: inputFieldsStyling.copyWith(
                            hintText: "enter your email"),
                        onChanged: (value){
                          email  = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      TextField(
                        obscureText: true,
                        decoration: inputFieldsStyling.copyWith(
                            hintText: "enter your password"),
                        onChanged: (value){
                          password  = value;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      appReusable.signBtn("Register", appColors.white,
                          appColors.purple, appColors.purple, () async{
                        setState(() {
                          showLoading = true;
                        });

                         try{
                           final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                           if(newUser!=null){
                             Navigator.pushNamed(context, chatScreen.chatScreenID);
                           }
                         }catch(e){
                           setState(() {
                             showLoading = false;
                           });
                           ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                               padding: EdgeInsets.all(25.0),
                               backgroundColor: appColors.white,
                               content: Text('Registeration failed. Please check your credentials and connection.',
                                 style: TextStyle(
                                     color: Colors.black
                                 ),
                               ),
                               action: SnackBarAction(
                                 label: 'Retry',
                                 onPressed: () {
                                 },
                               ),
                             ),
                           );
                         }

                      }),
                      SizedBox(
                        height: 20,
                      ),
                      appReusable.signBtn("Already have an account?",
                          appColors.purple, appColors.white, appColors.purple, () {
                        Navigator.pop(context);
                      })
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
