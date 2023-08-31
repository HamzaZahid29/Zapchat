import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zapchat/welcome_screen.dart';
import 'package:zapchat/login_screen.dart';
import 'package:zapchat/registration_screen.dart';
import 'package:zapchat/chat_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: welcomeScreen.screenID,
      routes: {
        welcomeScreen.screenID : (context){
         return welcomeScreen();
        },
        registerScreen.registerScreenID: (context){
         return registerScreen();
        },
        loginScreen.loginScreenID: (context){
         return loginScreen();
        },
        chatScreen.chatScreenID: (context){
         return chatScreen();
        }
      },
    );
  }
}
