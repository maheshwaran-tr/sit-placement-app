import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JobAppliedListPage extends StatefulWidget {
  @override
  _JobAppliedListPageState createState() => _JobAppliedListPageState();
}

class _JobAppliedListPageState extends State<JobAppliedListPage> {
  List<Student> students = [
    Student(name: 'John Doe', appliedCompanyName: 'ABC Corp'),
    Student(name: 'Jane Smith', appliedCompanyName: 'XYZ Ltd'),
    Student(name: 'Bob Johnson', appliedCompanyName: '123 Industries'),
    // Add more dummy data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          'Job Applied List',
          style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(8),
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Icon(
                          Icons.work,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        students[index].name,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          'Applied to: ${students[index].appliedCompanyName}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                      trailing: Checkbox(
                        value: students[index].isApproved,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            students[index].isApproved = value!;
                          });
                        },
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 5),
                itemCount: students.length,
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: ElevatedButton.icon(
                onPressed: isAnyStudentSelected() ? () => showApprovalMessage(context) : null,
                icon: Icon(
                  Icons.check,
                  size: 24,
                ),
                label: Text(
                  'Approve Selected',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isAnyStudentSelected() {
    return students.any((student) => student.isApproved);
  }

  void showApprovalMessage(BuildContext context) {
    // Create a GlobalKey for the overlay
    GlobalKey<State> overlayKey = GlobalKey<State>();

    // Show overlay
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        bottom: 0.0,
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );

    Overlay.of(context)!.insert(overlayEntry);

    // Delay for 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      // Remove overlay after delay
      overlayEntry.remove();

      // Show success message
      showDialog(
        context: context,
        builder: (context) => Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 50,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Selected students approved successfully!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Done"))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

}

class Student {
  final String name;
  final String appliedCompanyName;
  bool isApproved;

  Student({
    required this.name,
    required this.appliedCompanyName,
    this.isApproved = true,
  });
}