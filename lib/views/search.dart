import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:searchy/model/user_data.dart';
import 'package:searchy/repo/data_holder.dart';


class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SearchBar<UserData>(//Search library
              onSearch: search,
              onItemFound: (UserData data, index){
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: DataHolder.db.length,
                    itemBuilder: (BuildContext cont, index){
                      return Card(elevation: 3.0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
                        child: Row(textDirection: TextDirection.ltr, crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[Image.asset("eatery.png", height: 100.0,width: 100.0,), Padding(padding: EdgeInsets.only(left: 5.0)), Column(
                            children: <Widget>[Text(data.name,textDirection: TextDirection.ltr, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),), Padding(padding: EdgeInsets.only(top: 10.0)), Text('Loc: '+data.address, textDirection: TextDirection.ltr,), Padding(padding: EdgeInsets.only(top: 10.0)), Text('City: '+data.city, textDirection: TextDirection.ltr,), Padding(padding: EdgeInsets.only(top: 10.0)), Text('Country: '+data.country, textDirection: TextDirection.ltr,)],
                          )],
                        ),
                      );;

                    });
                //card here
              },
            ),);
  }

  //returns a future for search item
  Future<List<UserData>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    return DataHolder().getUsers();
  }
}