import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final pref = await SharedPreferences.getInstance();
    nameController.text = pref.getString('name') ?? '';
    surnameController.text = pref.getString('surname') ?? '';
  }

  Future<void> saveData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('name', nameController.text);
    await pref.setString('surname', surnameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Data')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.all(12),
                ),
                validator: (value) => value!.isEmpty ? 'Enter Name' : null,
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: surnameController,
                decoration: InputDecoration(
                  labelText: 'Surname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.all(12),
                ),
                validator: (value) => value!.isEmpty ? 'Enter Surname' : null,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    saveData();
                    Navigator.pop(context);
                  }
                },
                child: Text('Save', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
