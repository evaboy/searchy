import 'package:searchy/model/user_data.dart';

//In-Memory Database
class DataHolder{
  static List<UserData> db = new List();

  DataHolder();

  //Adds a new Restaurant to the db
  void addUser(String name, String address, String city, String country){
    db.add(new UserData(name, address, city, country));
  }

//Retrieves all the Restaurants
  List<UserData> getUsers(){
    return db;
  }
}