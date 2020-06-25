import 'package:flutter/material.dart';
import 'package:searchy/views/add_view.dart';
import 'package:searchy/views/home.dart';
import 'package:searchy/views/listing.dart';
import 'package:searchy/views/search.dart';

//Utility Class for holding views
class Utils{
  static final List<Widget> views = [Home(),new Listing(),new Search()];
}