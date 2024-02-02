import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/staff_model.dart';
import '../url_config/urls.dart';

class StaffRequest{

  static Future<Staff> getStaffProfile(String token) async {
    final response = await http.get(
      Uri.parse(Urls.staffByToken),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var obj = jsonDecode(response.body);
      final staff = Staff.fromJson(obj);
      return staff;
    } else {
      throw Exception('Failed to load staff profile: ${response.statusCode}');
    }
  }

  static Future<bool> addStaff(String token,Staff staff) async{
    final response = await http.post(
        Uri.parse(Urls.addStaffs),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(staff.toJson())
    );
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

}