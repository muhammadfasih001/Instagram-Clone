import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/color.dart';
import 'package:instagram_clone/controller/signout_controller.dart';

class InstaHomeScreen extends StatelessWidget {
  InstaHomeScreen({super.key});

  final signOutController = Get.put(SignOutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("INSTAGRAM"),
        actions: [
          IconButton(
            onPressed: () {
              signOutController.signOut();
            },
            icon: Icon(
              Icons.logout_outlined,
              color: AppColor.buttonColor,
            ),
          ),
        ],
      ),
    );
  }
}
