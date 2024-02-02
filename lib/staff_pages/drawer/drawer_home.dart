import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


import 'dashboard/staff_dashboard.dart';
import 'menu_page/menu_page.dart';

class StaffDrawerHome extends StatefulWidget {

  final token;

  const StaffDrawerHome({ Key? key,required this.token }) : super(key: key);

  @override
  State<StaffDrawerHome> createState() => _StaffDrawerHomeState();
}

class _StaffDrawerHomeState extends State<StaffDrawerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[400],
      body: ZoomDrawer(
        angle: 0.0,
        mainScreen: StaffDash(token: widget.token,),
        menuScreen: StaffMenuPage(token: widget.token),
      ),
    );
  }
}