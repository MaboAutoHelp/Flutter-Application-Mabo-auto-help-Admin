import 'package:app_admin/controller/NotificationsController.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart'; // استيراد مكتبة intl


class Notifications extends StatefulWidget {
  final String adminID;
  const Notifications({super.key, required this.adminID});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late Future<List> notifications;

  @override
  void initState() {
    super.initState();
    notifications = Notificationscontroller.getNotifications();
  }

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load notifications'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No notifications found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var notification = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title:
                        Text(notification['serviceName'] ?? 'No service name'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${(notification['name'])}'), 
                        Text('Tel: ${(notification['teluser'])}'), 
                        Text(
                            'Date: ${formatDate(notification['date'])}'), // تنسيق التاريخ
                        Text(
                           'Time: ${notification['time'] ?? 'No time'}'),
                        Text(
                            'Car Type: ${notification['carType'] ?? 'No car type'}'),
                        Text(
                            'ita Type: ${notification['ita'] ?? 'No ita type'}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
