// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:sit_placement_app/student_pages/drawer/menu_page/menu_page.dart';

import '../../backend/models/student_model.dart';
import '../../backend/requests/student_request.dart';


class StudentProfilePage extends StatefulWidget {
  final token;

  const StudentProfilePage({Key? key, required this.token}) : super(key: key);

  @override
  _StudentProfilePageState createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage> {
  final _drawerController = ZoomDrawerController();
  late Future<Student> studentFuture;
  bool isContactExpanded = false;

  @override
  void initState() {
    super.initState();
    studentFuture = initializeStudentData();
  }

  Future<Student> initializeStudentData() async {
    return StudentRequest.getStudentProfile(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
        leading: IconButton(
          onPressed: () {
            _drawerController.toggle!();
          },
          icon: Icon(
            Icons.dashboard_customize_rounded,
            size: 30,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Center(child: Text('Student Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 26),)),
      ),
      extendBodyBehindAppBar: true,

      body: SafeArea(

        child: ZoomDrawer(
          controller: _drawerController,
          style: DrawerStyle.defaultStyle,
          menuScreen: MenuPage(token: widget.token, selectedIndex: 1,),
          mainScreen: buildMainScreen(),
          borderRadius: 25.0,
          angle: 0, // Adjust the angle for a more dynamic appearance
          mainScreenScale: 0.2, // Adjust the scale for the main screen
          slideWidth: MediaQuery.of(context).size.width * 0.8,
        ),
      ),
    );
  }

  Widget buildMainScreen() {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.lightBlueAccent, Colors.white],
          ),
        ),
        child: FutureBuilder<Student>(
          future: studentFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text('No data available'),
              );
            } else {
              Student? student = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 45),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.network(
                                "https://rukminim2.flixcart.com/image/850/1000/l2rwzgw0/poster/6/v/3/medium-obito-uchiha-naruto-anime-series-matte-finish-poster-original-imagefd2yuvhfaw9.jpeg?q=20",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        student.studentName??"N/A",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        student.rollNo??"N/A",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        student.regNo??"N/A",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Center(
                      child: Text(
                        student.department??"N/A",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Center(
                      child: Text(
                        student.email??"N/A",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    buildExpansionTile(
                      title: 'Contact Information',
                      isExpanded: isContactExpanded,
                      onPressed: () {
                        setState(() {
                          isContactExpanded = !isContactExpanded;
                        });
                      },
                      children: [
                        ListTile(
                          leading: Icon(Icons.phone),
                          title: Text('Phone Number'),
                          subtitle: Text(student.phoneNumber??"N/A"),
                        ),
                        Divider(),
                        ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text('Address'),
                          subtitle: Text(student.presentAddress??"N/A"),
                        ),
                      ],
                    ),
                    // ... your existing code
                  ],
                ),
              );
            }
          },
        ),
      ),

    );

  }


  Widget buildExpansionTile({
    required String title,
    required bool isExpanded,
    required Function onPressed,
    required List<Widget> children,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ExpansionTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          onExpansionChanged: (value) {
            onPressed();
          },
          initiallyExpanded: isExpanded,
          children: children,
        ),
      ),
    );
  }
}