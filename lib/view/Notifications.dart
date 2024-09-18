/*import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_admin/controller/NotificationsController.dart';

class Notifications extends StatefulWidget {
  final String adminID;
  const Notifications({super.key, required this.adminID});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late Future<List> livraisonNotifications;
  late Future<List> sansLivraisonNotifications;

  @override
  void initState() {
    super.initState();
    livraisonNotifications = Notificationscontroller.getNotificationsLivraison();
    sansLivraisonNotifications = Notificationscontroller.getNotificationsSansLivraison();
  }

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  void handleAction(String id, String action) async {
    String itaValue = (action == 'accept') ? 'accepted' : 'rejected';

    try {
      await Notificationscontroller.updateService(id, itaValue, widget.adminID);
      setState(() {
        livraisonNotifications = Notificationscontroller.getNotificationsLivraison();
        sansLivraisonNotifications = Notificationscontroller.getNotificationsSansLivraison();
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

  Widget buildNotificationList(Future<List> notifications) {
    return FutureBuilder<List>(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Livraison'),
              Tab(text: 'Sans Livraison'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildNotificationList(livraisonNotifications),
            buildNotificationList(sansLivraisonNotifications),
          ],
        ),
      ),
    );
  }
}
*/
//-----
/*
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_admin/controller/NotificationsController.dart';

class Notifications extends StatefulWidget {
  final String adminID;
  const Notifications({super.key, required this.adminID});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late Future<List> livraisonNotifications;
  late Future<List> sansLivraisonNotifications;

  @override
  void initState() {
    super.initState();
    livraisonNotifications = Notificationscontroller.getNotificationsLivraison();
    sansLivraisonNotifications = Notificationscontroller.getNotificationsSansLivraison();
  }

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  void handleAction(String id, String action) async {
    String itaValue = (action == 'accept') ? 'accepted' : 'rejected';

    try {
      await Notificationscontroller.updateService(id, itaValue, widget.adminID);
      setState(() {
        livraisonNotifications = Notificationscontroller.getNotificationsLivraison();
        sansLivraisonNotifications = Notificationscontroller.getNotificationsSansLivraison();
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
          backgroundColor: Colors.red, // التنبيهات بالأحمر للأخطاء
        ),
      );
    }
  }

  Widget buildNotificationList(Future<List> notifications) {
    return FutureBuilder<List>(
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
                        style: TextStyle(color: Colors.grey[800]), // النصوص الثانوية باللون الرمادي الداكن
                      ),
                      Text(
                        'Tel: ${(notification['teluser'])}',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      Text(
                        'Date: ${formatDate(notification['date'])}',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      Text(
                        'Time: ${notification['time'] ?? 'No time'}',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      Text(
                        'Car Type: ${notification['carType'] ?? 'No car type'}',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      Text(
                        'Ita Type: ${notification['ita'] ?? 'No ita type'}',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          backgroundColor: Color(0xFF003366), // الأزرق الداكن للشريط العلوي
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Livraison'),
              Tab(text: 'Sans Livraison'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildNotificationList(livraisonNotifications),
            buildNotificationList(sansLivraisonNotifications),
          ],
        ),
      ),
    );
  }
}*/
//----
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:app_admin/controller/NotificationsController.dart';

class Notifications extends StatefulWidget {
  final String adminID;
  const Notifications({super.key, required this.adminID});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late Future<List> livraisonNotifications;
  late Future<List> sansLivraisonNotifications;

  @override
  void initState() {
    super.initState();
    livraisonNotifications = Notificationscontroller.getNotificationsLivraison();
    sansLivraisonNotifications = Notificationscontroller.getNotificationsSansLivraison();
  }

  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  void handleAction(String id, String action) async {
    String itaValue = (action == 'accept') ? 'accepted' : 'rejected';

    try {
      await Notificationscontroller.updateService(id, itaValue, widget.adminID);
      setState(() {
        livraisonNotifications = Notificationscontroller.getNotificationsLivraison();
        sansLivraisonNotifications = Notificationscontroller.getNotificationsSansLivraison();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Service $itaValue successfully'),
          backgroundColor: action == 'accept' ? Colors.green : Colors.red,
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update service: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Color getItaTypeColor(String itaType) {
    switch (itaType) {
      case 'attente':
        return Colors.orange;
      case 'accepted':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'La réparation est terminée':
        return Colors.blue;
      case 'Puis un problème':
        return Colors.purple;
      case 'yes':
        return Colors.teal;
      default:
        return Colors.black;
    }
  }

  Widget buildNotificationList(Future<List> notifications) {
    return FutureBuilder<List>(
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
                color: Colors.grey[200],
                margin: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                    notification['serviceName'] ?? 'No service name',
                    style: TextStyle(
                      color: Color(0xFF003366),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name: ${(notification['name'])}',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      Text(
                        'Tel: ${(notification['teluser'])}',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      Text(
                        'Date: ${formatDate(notification['date'])}',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      Text(
                        'Time: ${notification['time'] ?? 'No time'}',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      Text(
                        'Car Type: ${notification['carType'] ?? 'No car type'}',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      Text(
                        'Ita Type: ${notification['ita'] ?? 'No ita type'}',
                        style: TextStyle(
                          color: getItaTypeColor(notification['ita'] ?? 'No ita type'),
                        ),
                      ),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          backgroundColor: Color.fromARGB(255, 249, 249, 250),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Livraison'),
              Tab(text: 'Sans Livraison'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildNotificationList(livraisonNotifications),
            buildNotificationList(sansLivraisonNotifications),
          ],
        ),
      ),
    );
  }
}

