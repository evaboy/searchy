import 'package:flutter/material.dart';
import 'package:searchy/custom_app_bar.dart';
import 'package:searchy/model/user_data.dart';
import 'package:searchy/repo/data_holder.dart';
import 'package:searchy/views/restaurants.dart';

//View for adding a new Restaurant
class AddView extends StatefulWidget {
  AddView({Key key}) : super(key: key);

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  String _name;
  String _address;
  String _city;
  String _country;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.AppBar("Add Restaurant"),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[TextFormField(decoration: InputDecoration(icon: Icon(Icons.restaurant_menu), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)), labelText: "Restaurant Name", hintText: "Enter Restaurant Name"), validator: (name)=>validator(name), onSaved: (name){_name = name;},), Padding(padding: EdgeInsets.only(top:20.0)), TextFormField(decoration: InputDecoration(icon: Icon(Icons.location_on), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)), labelText: "Address", hintText: "Enter Restaurant Address"), validator: (address)=>validator(address), onSaved: (address){_address = address;},), Padding(padding: EdgeInsets.only(top:20.0)), TextFormField(decoration: InputDecoration(icon: Icon(Icons.location_city), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)), labelText: "City", hintText: "Enter city"), validator: (city)=>validator(city), onSaved: (city){_city=city;},), Padding(padding: EdgeInsets.only(top:20.0)), TextFormField(decoration: InputDecoration(icon: Icon(Icons.local_convenience_store), border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)), labelText: "Country", hintText: "Enter country"), validator: (country)=>validator(country), onSaved: (country){_country = country;},), Padding(padding: EdgeInsets.only(top:20.0)), RaisedButton(onPressed: ()=>onSubmit(context), child: Text("Submit"),)],
            )),
      ),

    );
  }

  String validator(String input){
    return input.isEmpty? "Invalid input":null;
  }

  void onSubmit(BuildContext context){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      setState(() {
        DataHolder().addUser(_name, _address, _city, _country);
      });
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return new AlertDialog(
            title: Text("Info"),
            content: Text("Data saved"),
            actions: <Widget>[RaisedButton(onPressed: (){Navigator.pop(context);Navigator.push(context, MaterialPageRoute(builder: (context)=>Restaurants()));}, child: Text('Ok'),)],
          );
        }
      );
    }
  }

}