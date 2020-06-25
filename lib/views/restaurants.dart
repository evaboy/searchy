import 'package:flutter/material.dart';
import 'package:searchy/custom_app_bar.dart';
import 'package:searchy/model/user_data.dart';
import 'package:searchy/repo/data_holder.dart';
import 'package:searchy/views/add_view.dart';

//View for Restaurant listing
class Restaurants extends StatefulWidget {
  Restaurants({Key key}) : super(key: key);

  @override
  _RestaurantsState createState() => _RestaurantsState();
}

class _RestaurantsState extends State<Restaurants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.AppBar("Restaurants"),
      body: SafeArea(
          top: true,
        child: FutureBuilder(
          builder: (BuildContext ctc, AsyncSnapshot<List<UserData>> snapShot){
            return ListView.builder(
              itemBuilder: (BuildContext ctx, int index){
                return Card(elevation: 3.0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                  child: Row(
                    children: <Widget>[Image.asset("eatery.png", height: 100.0,width: 100.0,), Padding(padding: EdgeInsets.only(left: 10.0)), Column(
                      children: <Widget>[Text(snapShot.data[index].name, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),), Padding(padding: EdgeInsets.only(top: 10.0)), Text(snapShot.data[index].address)],
                    )],
                  ),
                );
              },
              shrinkWrap: true,
              itemCount: snapShot.data.length,
              padding: EdgeInsets.only(top: 10.0, right: 15.0, left: 10.0),
            );
          },
          initialData: DataHolder.db,
          future: data(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>AddView())),
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(50, 120, 140, 1),
      ),
    );
  }

  Future<List<UserData>> data() async{
    return await DataHolder.db;
  }
}