import 'package:flutter/material.dart';
import 'package:sms/attendance.dart';

import '../login/login.dart';
import '../screens/Addstudent.dart';
import '../screens/addfacluty.dart';
import '../screens/view faclty.dart';
import '../screens/viewstudent.dart';

class CounsellorDashboard extends StatelessWidget {
  const CounsellorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counsellor Dashboard')),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            dashboardButton(context, 'Add Student', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddStudent()),
              );
            }),
            dashboardButton(context, 'View Student', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ViewStudent()),
              );
            }),
            dashboardButton(context, 'Attendance of Student', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AttendanceScreen()),
              );
            }),
            SizedBox(height: 30),
            dashboardButton(context, 'Add Faculty', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AddFaculty()),
              );
            }),
            dashboardButton(context, 'View Faculty', () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ViewFaculty()),
              );
            }),
            dashboardButton(context, 'Logout', () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
                (route) => false,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget dashboardButton(
    BuildContext context,
    String title,
    VoidCallback onTap,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: SizedBox(
        width: 260,
        height: 45,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade300,
            foregroundColor: Colors.black,
          ),
          child: Text(title),
        ),
      ),
    );
  }
}
