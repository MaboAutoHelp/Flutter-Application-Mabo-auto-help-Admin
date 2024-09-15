import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Micanicienscontroller{
  static Future<List> getMicaniciens() async {
    var url = "http://192.168.1.16:8000/Micaniciens/getAllMicaniciens";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load Micaniciens');
    }
  }

}