import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices extends ChangeNotifier{


  /// initlise so to remove the repeated async calls
  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// sharing the preferences in this
  static late final  SharedPreferences _prefs;

  Future<void> loginUser(String userName) async {
    try
    {
      // SharedPreferences sprefs = await _prefs;  ///storing the curr instance
      _prefs.setString('userName', userName);
    }
    catch(e){
      print(e);
    }
  }

  Future<bool> isLoggedIn() async {
    String? username = await _prefs.getString('userName');
    if(username == null) return false;
    return true;
  }

  void logoutUser()  {
    // SharedPreferences sprefs = await _prefs;  ///storing the curr instance
    _prefs.clear();
  }

  String?  getUserName() {
    // SharedPreferences sprefs = await _prefs;  ///storing the curr instance
    return _prefs.getString('userName') ?? 'DefaultValue';
  }

  /// demo of change notifier to update the username in shared preferences & notify the listeners
  void updateUserName(String newName)
  {
    _prefs.setString('newName', newName);
    notifyListeners();
  }
}