import 'package:app_admin/view/Service.dart';
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
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign out'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.assignment_ind_rounded),
              ),
              Tab(
                icon: Icon(Icons.car_crash_sharp),
              ),
              Tab(
                icon: Icon(Icons.circle_notifications),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
            //  child: Pagepersonnelle(adminID: widget.adminID),
            ),
             Center(
             child: Service(adminID: widget.adminID),
            ),
             Center(
             // child: Notifications(adminID: '',),
            ),
          ],
        ),
      ),
    );
  }
}
