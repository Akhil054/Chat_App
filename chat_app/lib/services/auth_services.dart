import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {

  /// sharing the preferences in this
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginUser(String userName) async {
    try
    {
      SharedPreferences sprefs = await _prefs;  ///storing the curr instance
      sprefs.setString('userName', userName);
    }
    catch(e){
      print(e);
    }

  }

  void logoutUser() async {
    SharedPreferences sprefs = await _prefs;  ///storing the curr instance
    sprefs.clear();
  }

  Future<String?> getUserName() async{
    SharedPreferences sprefs = await _prefs;  ///storing the curr instance
    return sprefs.getString('userName') ?? 'DefaultValue';

  }
}