import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sit_placement_app/ExcelService/student_excel_service/student_details_excel.dart';
import 'package:sit_placement_app/staff_pages/staff_home_page/student_details.dart';


import '../../backend/models/student_model.dart';



class StudentListPage extends StatefulWidget {
  final String department;
  final List<Student> students;

  StudentListPage({
    required this.department,
    required this.students,
  });

  @override
  _StudentListPageState


  createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  List<Student> filteredStudents = [];
  List<int> selectedBatchList = [];
  List<String> selectedSkillsList = [];
  String searchText = '';
  List<int> batchYears = [2023, 2022, 2021]; // List of available batch years


  @override
  void initState() {
    super.initState();
    filteredStudents = List.from(widget.students);
  }
  Future<void> _refreshData() async {
    // Implement the refresh functionality here...
    // Fetch updated data or perform any other necessary tasks
    await Future.delayed(Duration(seconds: 2)); // Simulating a delay

    setState(() {
      filteredStudents = List.from(widget.students);
      filterStudents();
    });
  }
  void filterStudents() {
    setState(() {
      if (selectedBatchList.isNotEmpty) {
        filteredStudents = widget.students.where((student) {
          return selectedBatchList.contains(student.batch);
        }).toList();
      } else if (selectedSkillsList.isNotEmpty) {
        filteredStudents = widget.students.where((student) {
          return selectedSkillsList
              .any((skill) => student.skills!.contains(skill));
        }).toList();
      } else {
        filteredStudents = List.from(widget.students);
      }

      if (searchText.isNotEmpty) {
        filteredStudents = filteredStudents.where((student) {
          return student.studentName!.toLowerCase().contains(searchText.toLowerCase());
        }).toList();
      }
    });
  }

  void downloadData() async{
    // Implement download functionality here...
    await StudentExcelService.createExcelFile(widget.students,"STUDENT-LIST");
  }

  void showBatchFilterDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Batch Filter',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: batchYears.length,
                  itemBuilder: (context, index) {
                    final year = batchYears[index];
                    return ListTile(
                      title: Text(
                        year.toString(),
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      tileColor: selectedBatchList.contains(year)
                          ? Colors.blue.withOpacity(0.2)
                          : null,
                      onTap: () {
                        setState(() {
                          if (selectedBatchList.contains(year)) {
                            selectedBatchList.remove(year);
                          } else {
                            selectedBatchList.add(year);
                          }
                          filterStudents();
                        });
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedBatchList.clear();
                    filterStudents();
                  });
                  Navigator.pop(context);
                },
                child: Text(
                  'Clear',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
          title: Text(
            'Student Details',
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: showBatchFilterDialog,
              icon: Icon(
                Icons.calendar_today,
                size: 24,
                color: Colors.black,
              ),
            ),

            IconButton(
              onPressed: downloadData,
              icon: Icon(
                Icons.download,
                size: 24,
                color: Colors.black,
              ),
            ),
          ],
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: RefreshIndicator(
          onRefresh: _refreshData,
          child: Column(children: [
            selectedBatchList.isNotEmpty || selectedSkillsList.isNotEmpty
                ? Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: [
                  if (selectedBatchList.isNotEmpty)
                    ...selectedBatchList.map((batchYear) {
                      return Chip(
                        label: Text(
                          'Batch $batchYear',
                          style: TextStyle(fontSize: 12),
                        ),
                        backgroundColor: Colors.blueAccent.withOpacity(0.5),
                        deleteIconColor: Colors.white,
                        onDeleted: () {
                          setState(() {
                            selectedBatchList.remove(batchYear);
                            filterStudents();
                          });
                        },
                      );
                    }).toList(),
                  if (selectedSkillsList.isNotEmpty)
                    ...selectedSkillsList.map((skill) {
                      return Chip(
                        label: Text(
                          'Skill: $skill',
                          style: TextStyle(fontSize: 12),
                        ),
                        backgroundColor:
                        Colors.orangeAccent.withOpacity(0.5),
                        deleteIconColor: Colors.white,
                        onDeleted: () {
                          setState(() {
                            selectedSkillsList.remove(skill);
                            filterStudents();
                          });
                        },
                      );
                    }).toList(),
                ],
              ),
            )
                : SizedBox.shrink(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              margin: EdgeInsets.all(16),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                    filterStudents();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search by student name',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  suffixIcon: searchText.isNotEmpty
                      ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey),
                    onPressed: () {
                      setState(() {
                        searchText = '';
                        filterStudents();
                      });
                    },
                  )
                      : null,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredStudents.length,
                itemBuilder: (context, index) {
                  final student = filteredStudents[index];
                  return Card(
                    elevation: 3,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  'Name: ${student.studentName}',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ),



                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              StudentDetailsPage(
                                                  student: student),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text('Reg No: ${student.regNo}',
                              style: TextStyle(fontSize: 14)),
                          SizedBox(height: 4),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ));
  }
}