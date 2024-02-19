import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sit_placement_app/backend/models/job_post_model.dart';
import 'package:sit_placement_app/backend/models/student_model.dart';



class PostedJobPage extends StatefulWidget {
  final token;
  final JobPostModel job;


  PostedJobPage({required this.job, this.token});

  @override
  State<PostedJobPage> createState() => _PostedJobPageState();
}

class _PostedJobPageState extends State<PostedJobPage> {
  bool hasApplied = false;
  late final Student studentData;
  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
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
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          widget.job.companyName,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Job ID: ${widget.job.jobId}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Company Name : ${widget.job.companyName}",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Job Name : ${widget.job.jobName}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black45),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Job Description:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                      ),
                      Text(
                        "${widget.job.jobDescription}",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Eligibility Criteria:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                      ),
                      Text(
                        "10th Mark: ${widget.job.eligible10ThMark}",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      Text(
                        "12th Mark: ${widget.job.eligible12ThMark}",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      Text(
                        "CGPA Mark: ${widget.job.eligibleCgpaMark}",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        "Interview Details:",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                      ),
                      Text(
                        "Venue: ${widget.job.venue}",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      Text(
                        "Date: ${widget.job.interviewDate}",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                      Text(
                        "Time: ${widget.job.interviewTime}",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

}