import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/main.dart';

class ShowDataPage extends StatelessWidget {
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Entered Data")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${userController.name.value}", style: TextStyle(fontSize: 18)),
            Text("Surname: ${userController.surname.value}", style: TextStyle(fontSize: 18)),
            Text("City: ${userController.city.value}", style: TextStyle(fontSize: 18)),
            Text("Phone: ${userController.phone.value}", style: TextStyle(fontSize: 18)),
            Text("Pincode: ${userController.pin.value}", style: TextStyle(fontSize: 18)),
          ],
        )),
      ),
    );
  }
}
