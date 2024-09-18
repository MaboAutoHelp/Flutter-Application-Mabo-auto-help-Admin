/*import 'package:app_admin/controller/MicaniciensController.dart';
import 'package:flutter/material.dart';

class Micaniciens extends StatefulWidget {
  final String adminID;
  const Micaniciens({super.key, required this.adminID});

  @override
  State<Micaniciens> createState() => _MicaniciensState();
}

class _MicaniciensState extends State<Micaniciens> {
  late Future<List> micaniciens;

  @override
  void initState() {
    super.initState();
    micaniciens = Micanicienscontroller.getMicaniciens();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: micaniciens,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load micaniciens'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No micaniciens found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var micanicien = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(micanicien['name'] ?? 'No name'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tel: ${(micanicien['tel'])}'),
                        Text('special: ${(micanicien['special'])}'),
                        
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
}*/
//-----
/*
import 'package:app_admin/controller/MicaniciensController.dart';
import 'package:flutter/material.dart';

class Micaniciens extends StatefulWidget {
  final String adminID;
  const Micaniciens({super.key, required this.adminID});

  @override
  State<Micaniciens> createState() => _MicaniciensState();
}

class _MicaniciensState extends State<Micaniciens> {
  late Future<List> micaniciens;

  @override
  void initState() {
    super.initState();
    micaniciens = Micanicienscontroller.getMicaniciens();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: FutureBuilder<List>(
        future: micaniciens,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load micaniciens'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No micaniciens found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var micanicien = snapshot.data![index];
                return Card(
                  color: Colors.grey[200], // الرمادي الفاتح لخلفية الكارد
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      micanicien['name'] ?? 'No name',
                      style: TextStyle(
                        color: Color(0xFF003366), // الأزرق الداكن للنص الأساسي
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tel: ${(micanicien['tel'])}',
                          style: TextStyle(color: Colors.grey[800]), // الرمادي الداكن للنصوص الثانوية
                        ),
                        Text(
                          'Special: ${(micanicien['special'])}',
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.warning, color: Colors.red), // الأحمر للتنبيه
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Warning: Mechanic has pending issues'),
                            backgroundColor: Colors.red, // خلفية التنبيه باللون الأحمر
                          ),
                        );
                      },
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
//-----
import 'package:app_admin/controller/MicaniciensController.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // استيراد مكتبة url_launcher

class Micaniciens extends StatefulWidget {
  final String adminID;
  const Micaniciens({super.key, required this.adminID});

  @override
  State<Micaniciens> createState() => _MicaniciensState();
}

class _MicaniciensState extends State<Micaniciens> {
  late Future<List> micaniciens;

  @override
  void initState() {
    super.initState();
    micaniciens = Micanicienscontroller.getMicaniciens();
  }

  // دالة لفتح تطبيق الاتصال
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: micaniciens,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load micaniciens'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No micaniciens found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var micanicien = snapshot.data![index];
                return Card(
                  color: Colors.grey[200], // الخلفية الرمادية الفاتحة للكارد
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                      micanicien['name'] ?? 'No name',
                      style: TextStyle(
                        color: Color(0xFF003366), // الأزرق الداكن للنص الأساسي
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tel: ${(micanicien['tel'])}',
                          style: TextStyle(color: Colors.grey[800]), // الرمادي الداكن للنصوص الثانوية
                        ),
                        Text(
                          'Special: ${(micanicien['special'])}',
                          style: TextStyle(color: Colors.grey[800]),
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.phone, color: Colors.green), // أيقونة الهاتف بلون أخضر
                          onPressed: () {
                            _makePhoneCall(micanicien['tel'] ?? ''); // الاتصال برقم الهاتف
                          },
                        ),
                        /*IconButton(
                          icon: Icon(Icons.warning, color: Colors.red), // الأحمر للتنبيه
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Warning: Mechanic has pending issues'),
                                backgroundColor: Colors.red, // خلفية التنبيه باللون الأحمر
                              ),
                            );
                          },
                        ),*/
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

