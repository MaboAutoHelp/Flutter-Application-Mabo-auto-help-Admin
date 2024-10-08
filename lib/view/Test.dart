/*import 'package:app_admin/controller/NotificationsController.dart';
import 'package:app_admin/controller/TestController.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Test extends StatefulWidget {
  final String adminID;
  const Test({super.key, required this.adminID});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late Future<List> notifications;

  @override
  void initState() {
    super.initState();
    notifications = Testcontroller.getService(widget.adminID);
  }

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  void handleAction(String id, String action) async {
    String itaValue = (action == 'accept')
        ? 'La réparation est terminée'
        : 'Puis un problème';

    try {
      await Notificationscontroller.updateServiceIta(id, itaValue);
      setState(() {
       // notifications = Notificationscontroller.getNotifications();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Service $itaValue successfully')),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update service: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load notifications'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No notifications found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var notification = snapshot.data![index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(notification['serviceName'] ?? 'No service name'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${(notification['name'])}'),
                        Text('Tel: ${(notification['teluser'])}'),
                        Text('Date: ${formatDate(notification['date'])}'),
                        Text('Time: ${notification['time'] ?? 'No time'}'),
                        Text('prix: ${notification['prix'] ?? 'No prix'}'),
                        Text('Car Type: ${notification['carType'] ?? 'No car type'}'),
                        Text('Ita Type: ${notification['ita'] ?? 'No ita type'}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.check, color: Colors.green),
                          onPressed: () => handleAction(notification['_id'], 'accept'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () => handleAction(notification['_id'], 'reject'),
                        ),
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
*/
import 'package:app_admin/controller/NotificationsController.dart';
import 'package:app_admin/controller/TestController.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Test extends StatefulWidget {
  final String adminID;
  const Test({super.key, required this.adminID});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  late Future<List> notifications;

  @override
  void initState() {
    super.initState();
    notifications = Testcontroller.getService(widget.adminID);
  }

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  void handleAction(String id, String action) async {
    String itaValue = (action == 'accept')
        ? 'La réparation est terminée'
        : 'Puis un problème';

    try {
      await Notificationscontroller.updateServiceIta(id, itaValue);
      setState(() {
        // يمكنك تحديث قائمة الإشعارات هنا إذا لزم الأمر
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Service $itaValue successfully'),
          backgroundColor: action == 'accept' ? Colors.green : Colors.red, // الأخضر للموافقة والأحمر للرفض
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update service: $error'),
          backgroundColor: Colors.red, // لون التنبيه عند حدوث خطأ
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed to load notifications'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No notifications found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var notification = snapshot.data![index];
                return Card(
                  color: Colors.grey[200], // الخلفية الرمادية الفاتحة للكارد
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      notification['serviceName'] ?? 'No service name',
                      style: TextStyle(
                        color: Color(0xFF003366), // النص الأزرق الداكن للعناوين
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${(notification['name'])}',
                          style: TextStyle(color: Colors.grey[800]), // النص الرمادي الداكن
                        ),
                        Text('Tel: ${(notification['teluser'])}', style: TextStyle(color: Colors.grey[800])),
                        Text('Date: ${formatDate(notification['date'])}', style: TextStyle(color: Colors.grey[800])),
                        Text('Time: ${notification['time'] ?? 'No time'}', style: TextStyle(color: Colors.grey[800])),
                        Text('Prix: ${notification['prix'] ?? 'No prix'}', style: TextStyle(color: Colors.grey[800])),
                        Text('Car Type: ${notification['carType'] ?? 'No car type'}', style: TextStyle(color: Colors.grey[800])),
                        Text('Ita Type: ${notification['ita'] ?? 'No ita type'}', style: TextStyle(color: Colors.grey[800])),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.check, color: Colors.green), // الزر الأخضر للموافقة
                          onPressed: () => handleAction(notification['_id'], 'accept'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red), // الزر الأحمر للرفض
                          onPressed: () => handleAction(notification['_id'], 'reject'),
                        ),
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
