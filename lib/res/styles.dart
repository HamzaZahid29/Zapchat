import 'package:flutter/material.dart';
import 'package:zapchat/res/colors.dart' as appColors;
//creating constants for textStyles

const medTextStyle = TextStyle(
  fontSize: 50,
  color: appColors.purple,
  fontWeight: FontWeight.w900
);
const lowTextStyle = TextStyle(
  fontSize: 30,
  color: appColors.purple,
  fontWeight: FontWeight.w900
);
const btnTextStyle = TextStyle(

);
const hintTextStyle = TextStyle(
  color: appColors.grey,
);
 var inputFieldsStyling = InputDecoration(
    contentPadding: EdgeInsets.all(20.0),
    border: OutlineInputBorder(
      borderRadius : BorderRadius.circular(35),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: appColors.grey),
      borderRadius: BorderRadius.circular(35),
    ),focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: appColors.purple),
      borderRadius: BorderRadius.circular(35),
    ),

    hintStyle:hintTextStyle);

 var messageFieldStyling = InputDecoration(
     contentPadding: EdgeInsets.all(15.0),
     border: OutlineInputBorder(
       borderRadius: BorderRadius.circular(35),
     ),
     enabledBorder: OutlineInputBorder(
       borderSide: BorderSide(color: appColors.grey),
       borderRadius: BorderRadius.circular(35),
     ),focusedBorder: OutlineInputBorder(
   borderSide: BorderSide(color: appColors.purple),
   borderRadius: BorderRadius.circular(35),
 ),

     hintStyle:hintTextStyle
 );