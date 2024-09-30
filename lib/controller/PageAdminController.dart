import 'dart:convert';
import 'package:http/http.dart' as http;

class Pageadmincontroller {
  static var por = "19";
   Future<Map<String, dynamic>> GetAdmin(String adminID) async {
    var url = "http://192.168.1.$por:8000/admin/getAdmin/$adminID";
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      return data;
    } else {
      throw Exception('Failed to load user data');
    }
  }


}