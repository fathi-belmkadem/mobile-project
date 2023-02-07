import 'dart:convert';
import 'package:http/http.dart' as http;

class RegisterService {
  Future<bool> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2:8000/api/registration"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({"name": name, "email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      {
        print(response.body);
        return true;
      }
    } else {
      print('Failed to connect!');
      return false;
    }
  }
}
