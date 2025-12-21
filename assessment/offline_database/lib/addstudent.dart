import 'package:flutter/material.dart';

import 'mydb_helper.dart';

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

  Widget buildInputBox({required Widget child}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Student")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildInputBox(
              child: TextField(
                controller: fname,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  border: InputBorder.none,
                ),
              ),
            ),
            buildInputBox(
              child: TextField(
                controller: lname,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  border: InputBorder.none,
                ),
              ),
            ),
            buildInputBox(
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: InputBorder.none,
                ),
              ),
            ),

            buildInputBox(
              child: DropdownButtonFormField<String>(
                value: course,
                items: ['BCA', 'BBA', 'MCA']
                    .map(
                      (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
                    )
                    .toList(),
                onChanged: (v) => setState(() => course = v!),
                decoration: InputDecoration(
                  labelText: 'Course',
                  border: InputBorder.none,
                ),
              ),
            ),

            buildInputBox(
              child: TextField(
                controller: address,
                decoration: InputDecoration(
                  labelText: 'Address',
                  border: InputBorder.none,
                ),
              ),
            ),
            buildInputBox(
              child: TextField(
                controller: pincode,
                decoration: InputDecoration(
                  labelText: 'Pincode',
                  border: InputBorder.none,
                ),
              ),
            ),

            buildInputBox(
              child: DropdownButtonFormField<String>(
                value: city,
                items: ['Delhi', 'Mumbai', 'Jaipur']
                    .map(
                      (e) => DropdownMenuItem<String>(value: e, child: Text(e)),
                    )
                    .toList(),
                onChanged: (v) => setState(() => city = v!),
                decoration: InputDecoration(
                  labelText: 'City',
                  border: InputBorder.none,
                ),
              ),
            ),

            buildInputBox(
              child: TextField(
                controller: fees,
                decoration: InputDecoration(
                  labelText: 'Total Fees',
                  border: InputBorder.none,
                ),
              ),
            ),
            buildInputBox(
              child: TextField(
                controller: contact,
                decoration: InputDecoration(
                  labelText: 'Contact',
                  border: InputBorder.none,
                ),
              ),
            ),
            buildInputBox(
              child: TextField(
                controller: marks,
                decoration: InputDecoration(
                  labelText: 'Marks',
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 10),

            FutureBuilder<List<Map<String, dynamic>>>(
              future: db.getFaculty(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                final list = snapshot.data!;

                if (list.isEmpty) {
                  return Text("No Faculty Available");
                }

                return buildInputBox(
                  child: DropdownButtonFormField<int>(
                    decoration: InputDecoration(
                      labelText: 'Faculty ID',
                      border: InputBorder.none,
                    ),
                    items: list.map<DropdownMenuItem<int>>((f) {
                      return DropdownMenuItem<int>(
                        value: f['id'] as int,
                        child: Text("Faculty ID ${f['id']}"),
                      );
                    }).toList(),
                    onChanged: (int? v) {
                      setState(() {
                        facultyId = v;
                      });
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
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

                  Navigator.pop(context);
                },
                child: Text("Add Student"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
