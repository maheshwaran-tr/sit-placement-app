import 'package:flutter/material.dart';

class AddStudentPage extends StatefulWidget {
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  TextEditingController studentIdController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController sectionController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController placeOfBirthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController presentAddressController = TextEditingController();
  TextEditingController communityController = TextEditingController();
  TextEditingController fathernameController = TextEditingController();
  TextEditingController fatheroccupationController = TextEditingController();
  TextEditingController mothernameController = TextEditingController();
  TextEditingController motheroccupationController = TextEditingController();
  TextEditingController score10thController = TextEditingController();
  TextEditingController board10thController = TextEditingController();
  TextEditingController yearofpassing10thController = TextEditingController();
  TextEditingController score12thController = TextEditingController();
  TextEditingController board12thController = TextEditingController();
  TextEditingController yearofpassing12thController = TextEditingController();
  TextEditingController scorediplomaController = TextEditingController();
  TextEditingController branchdiplomaController = TextEditingController();
  TextEditingController yearofpassingdiplomaController = TextEditingController();
  TextEditingController parentphnoController = TextEditingController();
  TextEditingController aadharController = TextEditingController();
  TextEditingController placementwillingController = TextEditingController();
  TextEditingController batchController = TextEditingController();
  TextEditingController currentsemController = TextEditingController();
  TextEditingController sem1gpaController = TextEditingController();
  TextEditingController sem2gpaController = TextEditingController();
  TextEditingController sem3gpaController = TextEditingController();
  TextEditingController sem4gpaController = TextEditingController();
  TextEditingController sem5gpaController = TextEditingController();
  TextEditingController sem6gpaController = TextEditingController();
  TextEditingController sem7gpaController = TextEditingController();
  TextEditingController sem8gpaController = TextEditingController();

  String errorMessage = "";
  bool isProcessing = false;

  void validateAndSubmit() {
    if (studentIdController.text.isEmpty ||
        studentNameController.text.isEmpty ||
        departmentController.text.isEmpty ||
        sectionController.text.isEmpty ||
        dobController.text.isEmpty ||
        genderController.text.isEmpty ||
        placeOfBirthController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneNumberController.text.isEmpty ||
        permanentAddressController.text.isEmpty ||
        presentAddressController.text.isEmpty ||
        currentsemController.text.isEmpty ||
        communityController.text.isEmpty ||
        fathernameController.text.isEmpty ||
        fatheroccupationController.text.isEmpty ||
        mothernameController.text.isEmpty ||
        motheroccupationController.text.isEmpty ||
        score10thController.text.isEmpty ||
        board10thController.text.isEmpty ||
        yearofpassing12thController.text.isEmpty ||
        scorediplomaController.text.isEmpty ||
        branchdiplomaController.text.isEmpty ||
        yearofpassingdiplomaController.text.isEmpty ||
        parentphnoController.text.isEmpty ||
        aadharController.text.isEmpty ||
        placementwillingController.text.isEmpty ||
        batchController.text.isEmpty ||
        sem2gpaController.text.isEmpty ||
        sem1gpaController.text.isEmpty ||
        sem3gpaController.text.isEmpty ||
        sem4gpaController.text.isEmpty ||
        sem5gpaController.text.isEmpty ||
        sem6gpaController.text.isEmpty ||
        sem7gpaController.text.isEmpty ||
        sem8gpaController.text.isEmpty) {
      setState(() {
        errorMessage = "Please fill in all fields";
      });
    } else {
      // Show processing state
      setState(() {
        errorMessage = "";
        isProcessing = true;
      });

      // Perform your submission logic here
      // You can use the values from the controllers
      Future.delayed(Duration(seconds: 2), () {
        // Reset processing state
        setState(() {
          isProcessing = false;
        });

        // Show a success popup
        showSuccessDialog();

        // Clear text fields
        studentIdController.clear();
        studentNameController.clear();
        departmentController.clear();
        sectionController.clear();
        dobController.clear();
        genderController.clear();
        placeOfBirthController.clear();
        emailController.clear();
        phoneNumberController.clear();
        permanentAddressController.clear();
        presentAddressController.clear();
        currentsemController.clear();
        communityController.clear();
        fathernameController.clear();
        fatheroccupationController.clear();
        mothernameController.clear();
        motheroccupationController.clear();
        score10thController.clear();
        board10thController.clear();
        yearofpassing12thController.clear();
        scorediplomaController.clear();
        branchdiplomaController.clear();
        yearofpassingdiplomaController.clear();
        parentphnoController.clear();
        aadharController.clear();
        placementwillingController.clear();
        batchController.clear();
        sem2gpaController.clear();
        sem1gpaController.clear();
        sem3gpaController.clear();
        sem4gpaController.clear();
        sem5gpaController.clear();
        sem6gpaController.clear();
        sem7gpaController.clear();
        sem8gpaController.clear();
      });
    }
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 60.0,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Success',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text('Student details submitted successfully!'),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
        title: Center(
          child: Text(
            "Add Student ",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      backgroundColor: Colors.white,


      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextField("Student ID", Icons.person_outline, studentIdController),
                      buildTextField("Student Name", Icons.person, studentNameController),
                      buildTextField("Department", Icons.work, departmentController),
                      buildTextField("Section", Icons.abc_outlined, sectionController),
                      buildTextField("Date of Birth", Icons.calendar_today, dobController),
                      buildTextField("Gender", Icons.transgender, genderController),
                      buildTextField("Place of Birth", Icons.location_on, placeOfBirthController),
                      buildTextField("Email", Icons.email, emailController),
                      buildTextField("Phone Number", Icons.phone, phoneNumberController),
                      buildTextField("Permanent Address", Icons.home, permanentAddressController),
                      buildTextField("Present Address", Icons.location_city, presentAddressController),
                      buildTextField("Community", Icons.group, communityController),
                      buildTextField("Father's Name", Icons.person, fathernameController),
                      buildTextField("Father's Occupation", Icons.work, fatheroccupationController),
                      buildTextField("Mother's Name", Icons.person, mothernameController),
                      buildTextField("Mother's Occupation", Icons.work, motheroccupationController),
                      buildTextField("10th Score", Icons.score, score10thController),
                      buildTextField("10th Board", Icons.score, board10thController),
                      buildTextField("10th Year of Passing", Icons.calendar_today, yearofpassing10thController),
                      buildTextField("12th Score", Icons.score, score12thController),
                      buildTextField("12th Board", Icons.score, board12thController),
                      buildTextField("12th Year of Passing", Icons.calendar_today, yearofpassing12thController),
                      buildTextField("Diploma Score", Icons.score, scorediplomaController),
                      buildTextField("Diploma Branch", Icons.work, branchdiplomaController),
                      buildTextField("Diploma Year of Passing", Icons.calendar_today, yearofpassingdiplomaController),
                      buildTextField("Parent's Phone Number", Icons.phone, parentphnoController),
                      buildTextField("Aadhar Number", Icons.credit_card, aadharController),
                      buildTextField("Placement Willingness", Icons.work, placementwillingController),
                      buildTextField("Batch", Icons.date_range, batchController),
                      buildTextField("Current Semester", Icons.date_range, currentsemController),
                      buildTextField("Semester 1 GPA", Icons.score, sem1gpaController),
                      buildTextField("Semester 2 GPA", Icons.score, sem2gpaController),
                      buildTextField("Semester 3 GPA", Icons.score, sem3gpaController),
                      buildTextField("Semester 4 GPA", Icons.score, sem4gpaController),
                      buildTextField("Semester 5 GPA", Icons.score, sem5gpaController),
                      buildTextField("Semester 6 GPA", Icons.score, sem6gpaController),
                      buildTextField("Semester 7 GPA", Icons.score, sem7gpaController),
                      buildTextField("Semester 8 GPA", Icons.score, sem8gpaController),

                      // Display error message if there is any
                      Text(
                        errorMessage,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 16.0),
                      // Submit button with circular loading indicator
                      Center(
                        child: ElevatedButton(
                          onPressed: isProcessing ? null : validateAndSubmit,
                          child: isProcessing
                              ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                              : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.send),
                              SizedBox(width: 8.0),
                              Text('Submit'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (isProcessing) buildLoadingOverlay(),
        ],
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(icon),
            ],
          ),
          SizedBox(height: 8.0),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoadingOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );
  }
}