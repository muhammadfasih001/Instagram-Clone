import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/Screen/home/instaHome_screen.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = true.obs;

  void logInWithEmailAndPassword(BuildContext context) async {
    isLoading.value = true;

    String emailCheck = emailController.text.trim();
    String passwordCheck = passwordController.text.trim();

    if (emailCheck.isEmpty || passwordCheck.isEmpty) {
      Get.snackbar("Error", "Please Enter Email and Password");
      isLoading.value = false;
    } else {
      try {
        isLoading.value = true;
        await _auth.signInWithEmailAndPassword(
            email: emailCheck, password: passwordCheck);

        Get.snackbar("Log In Successfully",
            "User with email $emailCheck log in Successfully");
        isLoading.value = false;
        Get.offAll(() => InstaHomeScreen());
        clearControllers();
      } on FirebaseException catch (error) {
        Get.snackbar("Error", error.message ?? "An error occurred");
        isLoading.value = false;
      } catch (e) {
        Get.snackbar("Error", e.toString());
        isLoading.value = false;
      }
    }
  }

  passwordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  clearControllers() {
    emailController.clear();
    passwordController.clear();
  }
}
