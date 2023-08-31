import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zapchat/res/reusable_widgets.dart';
import 'package:zapchat/res/styles.dart';
import 'package:zapchat/res/colors.dart' as appColors;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class chatScreen extends StatefulWidget {
  static String chatScreenID = "chat";
  const chatScreen({super.key});

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  final messageTextController = TextEditingController();
  String messageText = "";
  late String? userEmail;
  late bool isMe;
  @override
  void initState() {
    getCurrentUser();
    // TODO: implement initState
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final currentUser = await _auth.currentUser;
      if (currentUser != null) {
        final User user = currentUser;
        userEmail = user.email;
        isMe = true;

      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            _auth.signOut();
            Navigator.pop(context);
          },
          child: Icon(
            Icons.logout,
            color: appColors.purple,
          ),
        ),
        centerTitle: true,
        backgroundColor: appColors.white,
        title: Text(
          "zapchat",
          style: TextStyle(color: appColors.purple),
        ),
      ),
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18,vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  StreamBuilder(
                      stream: _firestore.collection('messages').orderBy('timestamp',descending: true).snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: appColors.purple,
                            ),
                          ); // This can help you determine if data is coming in.
                        }

                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        else{

                          final messages = snapshot.data?.docs;
                          List<Widget> chatWidgets = [];
                          for(var message in messages!){

                            print(message.data().toString());
                            final messageText = message['text'];
                            final senderText = message['sender'];
                            final currentUser = _auth.currentUser?.email;
                            if(currentUser == senderText){
                              isMe = true;
                            }else{
                              isMe = false;
                            }
                            chatWidgets.add(fMessageWidget(messageText, senderText,isMe ));


                          }
                          return Expanded(
                            child: ListView(
                              reverse : true,
                              children: chatWidgets,
                            ),
                          );
                        }
                      }),

                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(0.0, -1.0), // shadow direction: bottom right
                )
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                      controller: messageTextController,
                  decoration: messageFieldStyling.copyWith(
                    hintText: "enter your message",
                  ),
                  onChanged: (value) {
                    messageText = value;
                  },
                )),
                TextButton(
                    onPressed: () {
                      if (!messageText.isEmpty) {
                        _firestore.collection('messages').add({
                          'text': messageText,
                          'sender': userEmail,
                          'timestamp': FieldValue.serverTimestamp(),
                        });
                        messageTextController.clear();
                      } else {

                      }
                    },
                    child: Icon(
                      Icons.send,
                      color: appColors.purple,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
