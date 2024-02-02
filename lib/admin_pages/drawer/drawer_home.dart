import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


import 'dashboard/dashboard.dart';
import 'menu_page/menu_page.dart';

class AdminDrawerHome extends StatefulWidget {

  final token;

  const AdminDrawerHome({ Key? key,required this.token }) : super(key: key);

  @override
  State<AdminDrawerHome> createState() => _AdminDrawerHomeState();
}

class _AdminDrawerHomeState extends State<AdminDrawerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[400],
      body: ZoomDrawer(
        angle: 0.0,
        mainScreen: AdminDash(token: widget.token),
        menuScreen: AdminMenuPage(token: widget.token),
      ),
    );
  }
}