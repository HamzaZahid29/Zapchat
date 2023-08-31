import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:zapchat/login_screen.dart';
import 'package:zapchat/registration_screen.dart';
import 'package:zapchat/res/reusable_widgets.dart';
import 'package:zapchat/res/styles.dart';
import 'package:zapchat/res/reusable_widgets.dart';
import 'package:zapchat/res/colors.dart' as appColors;
import 'package:zapchat/res/constants.dart' as appConsts;
import 'registration_screen.dart';

class welcomeScreen extends StatefulWidget {

  static String screenID = 'welcomeScreen';
  const welcomeScreen({super.key});

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  Duration _loadDuration = Duration(seconds: 2);
  Duration _waveDuration = Duration(seconds: 5);
  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: "fff",
                    child: Container(
                      height: 70,
                      child: Image.asset(
                        'assets/icon.png',
                      ),
                    ),
                  ),
                  TextLiquidFill(text: 'zapchat',

                    loadDuration: _loadDuration,
                    waveDuration: _waveDuration,
                    textStyle: medTextStyle,
                      waveColor: appColors.purple,
                      boxBackgroundColor: Colors.white,
                      boxHeight: 80,
                    boxWidth: 200,
                  ),

                ],
              ),

              SizedBox(
                height: 70,
              ),
              signBtn('Login',appColors.white, appColors.purple,appColors.purple, () {
                Navigator.pushNamed(context, loginScreen.loginScreenID);
              }),
              SizedBox(
                height: 20,
              ),
              signBtn('Register',appColors.purple, appColors.white,appColors.purple, () {
                Navigator.pushNamed(context, registerScreen.registerScreenID);
              })
            ],
          ),
        ),
      ),
    );
  }
}
