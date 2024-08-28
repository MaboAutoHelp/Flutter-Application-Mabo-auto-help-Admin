import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Notificationscontroller {
  /*static Future<List> getNotifications() async {
    var url = "http://192.168.1.17:8000/Service/getAllServicesAttente";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load notifications');
    }
  }*/
  static Future<List> getNotificationsLivraison() async {
    var url = "http://192.168.1.17:8000/Service/livraison";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load livraison notifications');
    }
  }

  static Future<List> getNotificationsSansLivraison() async {
    var url = "http://192.168.1.17:8000/Service/SansLivraison";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load sans livraison notifications');
    }
  }
  static Future<void> updateService(String id, String ita ,String MicanicienID) async {
    var url = "http://192.168.1.17:8000/Service/updateService/$id";
    var response = await http.put(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'ita': ita,'MicanicienID':MicanicienID}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update service');
    }
  }
  static Future<void> updateServiceIta(String id, String ita ) async {
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