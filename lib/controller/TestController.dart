import 'dart:convert';
//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Testcontroller{
    static Future<List> getService(String id) async {
    var url = "http://192.168.1.17:8000/Service/getServiceMicaniciens/$id";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load notifications');
    }
  }
}