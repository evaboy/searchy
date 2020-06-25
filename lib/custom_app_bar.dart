import 'package:flutter/material.dart';


class CustomAppBar extends AppBar{
  Text title;
  Color backgroundColor;
  RoundedRectangleBorder border;
  bool centerTitle;
  CustomAppBar(this.title, this.backgroundColor, this.border, this.centerTitle):super(title: title, shape: border, backgroundColor: backgroundColor, centerTitle: centerTitle);

  factory CustomAppBar.AppBar(String title){
    return CustomAppBar(Text(title), Color.fromRGBO(50, 120, 140, 1), RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),true);
  }
}