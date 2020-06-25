//Model Class
class UserData{
  String _name;
  String _address;
  String _city;
  String _country;

  UserData(this._name, this._address, this._city, this._country);

  String get country => _country;

  set country(String value) {
    _country = value;
  }

  String get city => _city;

  set city(String value) {
    _city = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }


}