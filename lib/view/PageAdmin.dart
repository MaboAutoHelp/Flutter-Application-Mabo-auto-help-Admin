import 'package:app_admin/controller/PageAdminController.dart';
import 'package:flutter/material.dart';


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
     
      body: FutureBuilder<Map<String, dynamic>>(
        future: _adminData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Assuming that the name is stored in 'name' field
            String adminName = snapshot.data!['username'] ?? 'Unknown Admin';
            String adminpassword = snapshot.data!['password'] ?? 'Unknown Admin';
            return Center(
              child: Text(
                adminName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // هنا تغير اللون كما تريد
                ),
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
