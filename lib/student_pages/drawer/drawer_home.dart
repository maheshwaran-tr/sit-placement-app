import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sit_placement_app/student_pages/drawer/dashboard/dashboard.dart';

import 'menu_page/menu_page.dart';


class StudentDrawerHome extends StatefulWidget {

  final token;

  const StudentDrawerHome({ Key? key,required this.token }) : super(key: key);

  @override
  State<StudentDrawerHome> createState() => _StudentDrawerHomeState();
}

class _StudentDrawerHomeState extends State<StudentDrawerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[400],
      body: ZoomDrawer(
        angle: 0.0,
        mainScreen: DashBoard(token: widget.token,),
        menuScreen: MenuPage(token: widget.token,),
      ),
    );
  }
}