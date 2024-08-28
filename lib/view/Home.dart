import 'package:app_admin/view/Micaniciens.dart';
import 'package:app_admin/view/Notifications.dart';
import 'package:app_admin/view/PageAdmin.dart';
import 'package:app_admin/view/Test.dart';

import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  final String adminID;

  const Home({super.key, required this.adminID});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign out'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.assignment_ind_rounded),
              ),
              Tab(
                icon: Icon(Icons.build),
              ),
              Tab(
                icon: Icon(Icons.circle_notifications),
              ),
              Tab(
                icon: Icon(Icons.add_task_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
             child: Pageadmin(adminID: widget.adminID),
            ),
             Center(
             child: Micaniciens(adminID: widget.adminID),
            ),
             Center(
              child: Notifications(adminID: widget.adminID),
            ),
            Center(
              child: Test(adminID: widget.adminID),
            ),
          ],
        ),
      ),
    );
  }
}
