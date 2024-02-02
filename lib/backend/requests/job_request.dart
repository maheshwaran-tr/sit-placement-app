import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sit_placement_app/backend/models/job_post_model.dart';

import '../url_config/urls.dart';

class JobRequest{

  static Future<bool> postTheJob(String token, JobPostModel job) async {
    var regBody = job.toJson();
    final response = await http.post(Uri.parse(Urls.addJobs),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(regBody));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<JobPostModel>> getAllJobs(String token) async {
    final response = await http.get(
      Uri.parse(Urls.allJobs),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print("Sucess");
      List<dynamic> jsonData = jsonDecode(response.body) as List<dynamic>;

      List<JobPostModel> joblist = [];
      for (var obj in jsonData) {
        if (obj is Map<String, dynamic>) {
          final pobj = JobPostModel.fromJson(obj);
          joblist.add(pobj);
        }
      }
      print(joblist);
      return joblist;
    }
    throw Exception('Failed to load jobs');
  }

  static Future<void> applyJob(int jobId,int rollNo,String token) async{
    var regBody = {
      "jobId":jobId,
      "studentId":rollNo
    };
    var response = await http.post(Uri.parse(Urls.applyJob),
        headers: {'Authorization': 'Bearer $token',"Content-Type": "application/json"},
        body: jsonEncode(regBody));
    print(jsonEncode(regBody));
    if(response.statusCode == 200){
      print("APPLIED");
    }else{
      print("FAILED");
    }
  }
}