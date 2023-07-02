import 'package:flutter/material.dart';

const Color scaffoldColor = Color(0xff1c2833);
const Color primaryColor = Color(0xff17202A);
const Color secondaryColor = Color(0xff3283DF);
const Color textColor = Colors.white;

Color setColor(double percentage){
  if(percentage >=0.50){
    return scaffoldColor;
  }else if(percentage >=0.25){
    return Colors.orange;
  }else{
    return Colors.red;
  }
}