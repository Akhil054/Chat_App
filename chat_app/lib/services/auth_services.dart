import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {


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

  void logoutUser()  {
    // SharedPreferences sprefs = await _prefs;  ///storing the curr instance
    _prefs.clear();
  }

  String?  getUserName() {
    // SharedPreferences sprefs = await _prefs;  ///storing the curr instance
    return _prefs.getString('userName') ?? 'DefaultValue';

  }
}