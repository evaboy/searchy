import 'package:flutter/material.dart';
import 'package:searchy/repo/data_holder.dart';
import 'package:searchy/views/add_view.dart';
import 'package:searchy/views/restaurants.dart';

//Checks if there is an entry in db, if yes, it displays Oops!! no restaurant found
//else if displays a list of registered restaurant
class Listing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataHolder.db.isEmpty ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Text("Oops! No Restaurants found. Please add Restaurant", style: TextStyle(fontSize: 20)), Padding(padding: EdgeInsets.only(top: 10.0)), OutlineButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AddView())), child: Text("Add Restaurant"),)]),): new Restaurants();

  }
}
