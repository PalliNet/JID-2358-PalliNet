import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  final String uid = "auth_token";
  late final SharedPreferences prefs;

  // Set values
  Future<void> setUid(String uid) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(this.uid, uid);
  }

  // Get values
  Future<String?> getUid() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? uid;
    uid = pref.getString(this.uid);
    return uid;
  }

  // Clear values
  clearAll() async {
    prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
