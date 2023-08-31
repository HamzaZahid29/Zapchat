import 'package:flutter/material.dart';
import 'package:zapchat/res/colors.dart' as appColors;
import 'package:zapchat/res/styles.dart' as appfontStyles;
import 'package:zapchat/res/styles.dart';

// sign in and login Button
class signBtn extends StatelessWidget {
  String btnText;
  Color btnTextColor;
  Color btnColor;
  Color btnBorderColor;
  VoidCallback onPressFunc;

  signBtn(this.btnText, this.btnTextColor, this.btnColor, this.btnBorderColor,
      this.onPressFunc);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressFunc,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(btnText,
            style: TextStyle(
              fontSize: 20,
              color: btnTextColor,
            )),
      ),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(color: btnBorderColor))),
          backgroundColor: MaterialStateProperty.all(btnColor)),
    );
  }
}

class textField extends StatelessWidget {
  String TFhint;
  String userEmail;

  textField(this.TFhint, this.userEmail);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        userEmail = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.grey),
            borderRadius: BorderRadius.circular(35),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.purple),
            borderRadius: BorderRadius.circular(35),
          ),
          hintText: TFhint,
          hintStyle: hintTextStyle),
    );
  }
}

class passtextField extends StatelessWidget {
  String TFhint;
  String userPassword;

  passtextField(this.TFhint, this.userPassword);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        userPassword = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.grey),
            borderRadius: BorderRadius.circular(35),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.purple),
            borderRadius: BorderRadius.circular(35),
          ),
          hintText: TFhint,
          hintStyle: hintTextStyle),
    );
  }
}

class messageTextField extends StatelessWidget {
  String TFhint;

  messageTextField(this.TFhint);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.grey),
            borderRadius: BorderRadius.circular(35),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: appColors.purple),
            borderRadius: BorderRadius.circular(35),
          ),
          hintText: TFhint,
          hintStyle: hintTextStyle),
    );
  }
}

class fMessageWidget extends StatelessWidget {
  String _messageText;
  String _sender;
  bool _isMe;

  fMessageWidget(this._messageText, this._sender, this._isMe);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Column(
        mainAxisAlignment:
            _isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment:
            _isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _sender,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 10,
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: _isMe ? Colors.purple : Colors.white,
                // Background color of the container

                borderRadius: _isMe ? BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ) : BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),// Border radius
                border: Border.all(
                  color: Colors.black12, // Border color
                  width: 2.0, // Border width
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                _messageText,
                style: TextStyle(fontWeight: FontWeight.bold,
                color: _isMe? Colors.white:Colors.black),
              )),
        ],
      ),
    );
  }
}
