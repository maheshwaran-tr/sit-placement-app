class Urls {

  // static const baseurl = "http://10.0.2.2:3030/sit";
  //
  // static const loginUrl = "$baseurl/auth/login"; // post
  //
  // static const logoutUrl = "$baseurl/auth/logout"; // get
  //
  // static const refreshTokenUrl = "$baseurl/auth/refresh-token"; // get
  //
  // static const allStudentsUrl = "$baseurl/students/all"; // get
  //
  // static const studentProfileUrl = "$baseurl/students/profile"; // get
  //
  // static const addStudentUrl = "$baseurl/students/add"; // post
  //
  // static const updateStudentUrl = "$baseurl/students/update"; // put
  //
  // static const deleteStudentUrl = "$baseurl/students/delete"; // get
  //
  // static const staffProfileUrl = "$baseurl/staffs/profile"; // get
  //
  // static const addStaffUrl = "$baseurl/staffs/add";   //post
  //
  // static const postJobUrl = "$baseurl/jobs/post-job";  //post
  //
  // static const allJobsUrl = "$baseurl/jobs/all";  //post
  //
  // static const applyJobUrl = "$baseurl/students/apply-job";   // post
  //
  // static const getStudentsDeptUrl = "$baseurl/students/dept/CSD";   // get
  //
  // static const updatePlacementWillingUrl = "$baseurl/students/update-placement-willing"; // put
  //
  // static const getPlacementWillingListUrl = "$baseurl/students/get-placement-willing-list/yes";  // get

  static const baseurl = "http://10.0.2.2:7070/sit";

  // Auth Urls
  static final String loginUser = "$baseurl/auth/login";
  static final String registerUser = "$baseurl/auth/register";
  static final String logoutUser = "$baseurl/auth/logout";
  static final String refreshToken = "$baseurl/auth/refresh-token";

  // Student Urls
  static final String allStudents = "$baseurl/students/all";
  static final String addStudents = "$baseurl/students/add";
  static final String updateStudents = "$baseurl/students/update";
  static final String deleteStudents = "$baseurl/students/delete/{id}";
  static final String studentByToken = "$baseurl/students/profile";
  static final String studentsByDept = "$baseurl/students/dept/{dept}";
  static final String studentsByPlacementWilling = "$baseurl/students/get-placement-willing-list/{val}";
  static final String applyJob = "$baseurl/students/apply-job";
  static final String updatePlacementWilling = "$baseurl/students/update-placement-willing/{val}";

  // Staff Urls
  static final String allStaffs = "$baseurl/staffs/all";
  static final String addStaffs = "$baseurl/staffs/add";
  static final String updateStaffs = "$baseurl/staffs/update";
  static final String deleteStaffs = "$baseurl/staffs/delete/{id}";
  static final String staffByToken = "$baseurl/staffs/profile";

  // Job Urls
  static final String allJobs = "$baseurl/jobs/all";
  static final String addJobs = "$baseurl/jobs/add";
  static final String updateJobs = "$baseurl/jobs/update";
  static final String deleteJobs = "$baseurl/jobs/delete/{id}";

}
