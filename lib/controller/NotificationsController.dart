import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Notificationscontroller {
  static Future<List> getNotifications() async {
    var url = "http://192.168.1.17:8000/Service/getAllServices";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load notifications');
    }
  }
  static Future<void> updateService(String id, String ita) async {
    var url = "http://192.168.1.17:8000/Service/updateService/$id";
    var response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'ita': ita}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update service');
    }
  }
}