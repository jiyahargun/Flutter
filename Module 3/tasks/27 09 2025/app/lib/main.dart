import 'package:app/secondscreen.dart';
import 'package:app/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Splashscreen(), debugShowCheckedModeBanner: false));
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _FormExState();
}

class _FormExState extends State<Login> {
  TextEditingController num = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  var _formkey = GlobalKey<FormState>();
  var password = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tops Technologies")),
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
                      borderRadius: BorderRadius.circular(15.00),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: num,
                  decoration: InputDecoration(
                    labelText: "Enter number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.00),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: pass,
                  obscureText: password,
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.00),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        password ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          password = !password;
                        });
                      },
                    ),
                  ),

                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Password";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    String a = num.text.toString();
                    String b = pass.text.toString();
                    String n = name.text.toString();

                    if (_formkey.currentState!.validate()) {
                      if (a == "1010101010" && b == "1234") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Logged in Successfully")),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SecondScreen(username: name.text),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text("Login Failed")));
                      }
                    }
                  },
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
