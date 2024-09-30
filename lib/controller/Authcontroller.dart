import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class Authcontroller {
  static var por = "19";
  Future LoginAuth(email, pwd) async {
    var url = "http://192.168.1.$por:8000/admin/login";
    var response = await http.post(Uri.parse(url),
        body: jsonEncode(<String, String>{'username': email, 'password': pwd}),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    }
  }
}
