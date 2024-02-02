// To parse this JSON data, do
//
//     final jobAppliedModel = jobAppliedModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'package:sit_placement_app/backend/models/job_post_model.dart';
import 'dart:convert';

import 'package:sit_placement_app/backend/models/status_model.dart';
import 'package:sit_placement_app/backend/models/student_model.dart';

JobAppliedModel jobAppliedModelFromJson(String str) => JobAppliedModel.fromJson(json.decode(str));

String jobAppliedModelToJson(JobAppliedModel data) => json.encode(data.toJson());

class JobAppliedModel {
  final DateTime createdAt;
  final DateTime lastModifiedAt;
  final int jobAppliedId;
  final JobPostModel jobPost;
  final Student student;
  final StatusModel status;

  JobAppliedModel({
    required this.createdAt,
    required this.lastModifiedAt,
    required this.jobAppliedId,
    required this.jobPost,
    required this.student,
    required this.status,
  });

  factory JobAppliedModel.fromJson(Map<String, dynamic> json) => JobAppliedModel(
    createdAt: DateTime.parse(json["createdAt"]),
    lastModifiedAt: DateTime.parse(json["lastModifiedAt"]),
    jobAppliedId: json["jobAppliedId"],
    jobPost: JobPostModel.fromJson(json["jobPost"]),
    student: Student.fromJson(json["student"]),
    status: StatusModel.fromJson(json["status"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "lastModifiedAt": lastModifiedAt.toIso8601String(),
    "jobAppliedId": jobAppliedId,
    "jobPost": jobPost.toJson(),
    "student": student.toJson(),
    "status": status.toJson(),
  };
}




