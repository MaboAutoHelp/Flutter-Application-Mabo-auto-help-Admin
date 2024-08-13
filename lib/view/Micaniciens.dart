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
}
