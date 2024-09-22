import 'package:app_admin/controller/PageAdminController.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Pageadmin extends StatefulWidget {
  final String adminID;
  const Pageadmin({super.key, required this.adminID});

  @override
  State<Pageadmin> createState() => _PageadminState();
}

class _PageadminState extends State<Pageadmin> {
  late Future<Map<String, dynamic>> _adminData;

  @override
  void initState() {
    super.initState();
    _adminData = Pageadmincontroller().GetAdmin(widget.adminID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Details'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _adminData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // استرجاع البيانات من الاستجابة
            String adminID = snapshot.data!['_id'] ?? 'Unknown ID';
            String adminName = snapshot.data!['username'] ?? 'Unknown Admin';
            String adminPassword = snapshot.data!['password'] ?? 'Unknown Password';
            int adminRevenue = snapshot.data!['Revenu'] ?? 0;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // عرض معرف QR
                      IconButton(
                        icon: Icon(Icons.qr_code, color: Color(0xFFFFD700)), // لون أيقونة QR code أصفر
                        onPressed: () {
                          if (adminID.isNotEmpty) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('QR Code'),
                                content: SizedBox(
                                  width: 200.0, // عرض محدد
                                  height: 200.0, // ارتفاع محدد
                                  child: 
                              QrImageView(
                                  data:adminID , // البيانات المستلمة من الخادم
                                  version: QrVersions.auto,
                                  size: 200.0,
                                ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text('إغلاق'),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(width: 10),
                      
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Username: $adminName',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Password: $adminPassword',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Revenue: $adminRevenue',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

