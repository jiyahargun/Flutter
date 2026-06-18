import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final Function(String mobile, String password)
  onRegister;

  const RegisterScreen({
    super.key,
    required this.onRegister,
  });

  @override
  State<RegisterScreen> createState() =>
      _RegisterScreenState();
}

class _RegisterScreenState
    extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController name =
  TextEditingController();
  TextEditingController mobile =
  TextEditingController();
  TextEditingController email =
  TextEditingController();
  TextEditingController password =
  TextEditingController();
  TextEditingController confirmPassword =
  TextEditingController();

  @override
  void dispose() {
    name.dispose();
    mobile.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: name,
                decoration:
                const InputDecoration(
                  hintText: "Enter Name",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Name";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: mobile,
                decoration:
                const InputDecoration(
                  hintText: "Enter Mobile",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Mobile";
                  }
                  if (value.length != 10) {
                    return "Enter Valid Mobile";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: email,
                decoration:
                const InputDecoration(
                  hintText: "Enter Email",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Email";
                  }
                  if (!value.contains("@")) {
                    return "Enter Valid Email";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: password,
                obscureText: true,
                decoration:
                const InputDecoration(
                  hintText: "Enter Password",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Password";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: confirmPassword,
                obscureText: true,
                decoration:
                const InputDecoration(
                  hintText:
                  "Confirm Password",
                ),
                validator: (value) {
                  if (value !=
                      password.text) {
                    return "Password Not Match";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  if (_formKey
                      .currentState!
                      .validate()) {
                    widget.onRegister(
                      mobile.text.trim(),
                      password.text.trim(),
                    );

                    ScaffoldMessenger.of(
                        context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Registration Successful",
                        ),
                      ),
                    );

                    Navigator.pop(
                        context);
                  }
                },
                child:
                const Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}