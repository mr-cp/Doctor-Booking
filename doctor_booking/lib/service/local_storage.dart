import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static String? _token;


  static Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
    print('Initialized token: $_token');
  }

  static Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    _token = token;
    print('-----------$_token');
  }

  static String? get token => _token;
}
