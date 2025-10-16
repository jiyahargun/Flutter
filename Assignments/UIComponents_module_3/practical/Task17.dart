import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: FormEx(), debugShowCheckedModeBanner: false));
}

class FormEx extends StatefulWidget {
  const FormEx({super.key});

  @override
  State<FormEx> createState() => _FormExState();
}

class _FormExState extends State<FormEx> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mob = TextEditingController();
  TextEditingController pass = TextEditingController();
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registration Form")),
      body: Form(
        key: _formkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Enter name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "Please enter name";
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Enter email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "Please enter email";
                    if (!value.endsWith("@gmail.com"))
                      return "Email must end with @gmail.com";
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: mob,
                  decoration: InputDecoration(
                    labelText: "Enter Mobile",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) return "Please enter Mobile Number";
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: pass,
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) return "Please enter password";
                    if (value.length < 6)
                      return "Password must be at least 6 characters";
                    return null;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Registration Successful")),
                      );
                    }
                  },
                  child: Text("Register"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
