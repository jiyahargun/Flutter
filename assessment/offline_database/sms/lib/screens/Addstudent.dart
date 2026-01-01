import 'package:flutter/material.dart';
import 'package:sms/database/mydb_helper.dart';

import '../log/logservice.dart';

class AddStudent extends StatefulWidget {
  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final DBHelper db = DBHelper();

  final fname = TextEditingController();
  final lname = TextEditingController();
  final email = TextEditingController();
  final address = TextEditingController();
  final pincode = TextEditingController();
  final fees = TextEditingController();
  final contact = TextEditingController();
  final marks = TextEditingController();

  String course = 'BCA';
  String city = 'Delhi';
  int? facultyId;

  bool isValidName(String v) => RegExp(r'^[a-zA-Z]+$').hasMatch(v);

  bool isValidContact(String v) => RegExp(r'^\d{10}$').hasMatch(v);

  Widget box(Widget child) => Card(
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    margin: EdgeInsets.symmetric(vertical: 8),
    child: Padding(padding: EdgeInsets.all(8), child: child),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Student")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            box(
              TextField(
                controller: fname,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: InputBorder.none,
                ),
              ),
            ),
            box(
              TextField(
                controller: lname,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: InputBorder.none,
                ),
              ),
            ),
            box(
              TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: InputBorder.none,
                ),
              ),
            ),
            box(
              DropdownButtonFormField(
                value: course,
                items: ['BCA', 'BBA', 'MCA']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => setState(() => course = v!),
                decoration: InputDecoration(
                  labelText: 'Course',
                  border: InputBorder.none,
                ),
              ),
            ),
            box(
              TextField(
                controller: address,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: InputBorder.none,
                ),
              ),
            ),
            box(
              TextField(
                controller: pincode,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Pincode',
                  border: InputBorder.none,
                ),
              ),
            ),
            box(
              DropdownButtonFormField(
                value: city,
                items: ['Delhi', 'Mumbai', 'Jaipur']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => setState(() => city = v!),
                decoration: InputDecoration(
                  labelText: 'City',
                  border: InputBorder.none,
                ),
              ),
            ),
            box(
              TextField(
                controller: fees,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Total Fees',
                  border: InputBorder.none,
                ),
              ),
            ),
            box(
              TextField(
                controller: contact,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Contact',
                  border: InputBorder.none,
                ),
              ),
            ),
            box(
              TextField(
                controller: marks,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Marks',
                  border: InputBorder.none,
                ),
              ),
            ),

            FutureBuilder<List<Map<String, dynamic>>>(
              future: db.getFaculty(),
              builder: (_, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                final list = snapshot.data!;
                return box(
                  DropdownButtonFormField<int>(
                    decoration: InputDecoration(
                      labelText: 'Faculty ID',
                      border: InputBorder.none,
                    ),
                    items: list
                        .map(
                          (f) => DropdownMenuItem<int>(
                            value: f['id'] as int,
                            child: Text("Faculty ${f['id']}"),
                          ),
                        )
                        .toList(),
                    onChanged: (v) => facultyId = v,
                  ),
                );
              },
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (!isValidName(fname.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("First Name only alphabets")),
                  );
                  return;
                }
                if (!isValidContact(contact.text)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Contact must be 10 digits")),
                  );
                  return;
                }
                if (facultyId == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please select Faculty")),
                  );
                  return;
                }

                await db.addStudent({
                  'fname': fname.text,
                  'lname': lname.text,
                  'email': email.text,
                  'course': course,
                  'address': address.text,
                  'pincode': pincode.text,
                  'city': city,
                  'totalFees': fees.text,
                  'contact': contact.text,
                  'marks': marks.text,
                  'facultyId': facultyId,
                });

                await LogService.writeLog(
                  "Student Added: ${fname.text} ${lname.text}",
                );
                Navigator.pop(context);
              },
              child: Text("Add Student"),
            ),
          ],
        ),
      ),
    );
  }
}
