import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/Screen/login/login_screen.dart';

class SignUpController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxBool isPasswordVisible = true.obs;

  void signUpWithEmailAndPassword(BuildContext context) async {
    isLoading.value = true;
    String emailAddress = emailController.text.trim();
    String passwordCheck = passwordController.text.trim();

    if (emailAddress.isEmpty || passwordCheck.isEmpty) {
      Get.snackbar("Sign up Error", "Please fill all the values");
      isLoading.value = false;
    } else {
      try {
        isLoading.value = true;
        await _auth.createUserWithEmailAndPassword(
          email: emailAddress,
          password: passwordCheck,
        );
        isLoading.value = false;
        Get.snackbar(
          "Sign Up Successfully",
          "User with email $emailAddress registered successfully",
        );
        clearControllers();

        Get.offAll(() => LoginScreen());
      } on FirebaseAuthException catch (error) {
        Get.snackbar("Error", error.message ?? "An error occurred");
        isLoading.value = false;
      } catch (e) {
        Get.snackbar("Error", e.toString());
        isLoading.value = false;
      }
    }
  }

  void passwordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
  }
}
