import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/second.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: UserForm(),
  ));
}


class UserController extends GetxController {
  var name = ''.obs;
  var surname = ''.obs;
  var city = ''.obs;
  var phone = ''.obs;
  var pin = ''.obs;

  void saveData(String n, String s, String c, String p, String pinCode) {
    name.value = n;
    surname.value = s;
    city.value = c;
    phone.value = p;
    pin.value = pinCode;
  }
}


class UserForm extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController surnameCtrl = TextEditingController();
  final TextEditingController cityCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController pinCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Enter Your Details")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: nameCtrl, decoration: InputDecoration(labelText: "Name")),
            TextField(controller: surnameCtrl, decoration: InputDecoration(labelText: "Surname")),
            TextField(controller: cityCtrl, decoration: InputDecoration(labelText: "City")),
            TextField(controller: phoneCtrl, decoration: InputDecoration(labelText: "Phone Number")),
            TextField(controller: pinCtrl, decoration: InputDecoration(labelText: "Pincode")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                userController.saveData(
                  nameCtrl.text,
                  surnameCtrl.text,
                  cityCtrl.text,
                  phoneCtrl.text,
                  pinCtrl.text,
                );
                Get.to(() => ShowDataPage());
              },
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}