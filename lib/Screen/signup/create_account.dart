import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constant/color.dart';
import 'package:instagram_clone/constant/widget/auth_button.dart';
import 'package:instagram_clone/controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final signUpController = Get.put(SignUpController());
  final signUpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.sacfColor,
        body: SingleChildScrollView(
            child: Obx(
          () => Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "What's your email?",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      maxLines: 2,
                      "Enter the email and password where you can be contacted.No one will see this on your Profile",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: signUpFormKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: signUpController.emailController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 15.0),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.buttonColor,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (type) {
                          if (type!.isEmpty) {
                            return 'Enter your email';
                          }
                          final emailRegex = RegExp(
                              r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                          if (!emailRegex.hasMatch(type)) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: signUpController.passwordController,
                        obscureText: signUpController.isPasswordVisible.value,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          focusColor: Colors.white,
                          suffixIcon: InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              signUpController.passwordVisibility();
                            },
                            child: Icon(
                              signUpController.isPasswordVisible.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColor.buttonColor,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 30.0, horizontal: 15.0),
                          label: Text(
                            overflow: TextOverflow.ellipsis,
                            "Password",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade600,
                              fontSize: 20,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColor.buttonColor,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your Password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AuthButton(
                circularLoader: signUpController.isLoading.value,
                txtColor: Colors.white,
                bgcolo: AppColor.buttonColor,
                title: "Signup",
                onTap: () {
                  if (signUpFormKey.currentState!.validate()) {
                    signUpController.signUpWithEmailAndPassword(context);
                  }
                },
                height: 60,
                width: 350,
              ),
              const SizedBox(
                height: 420,
              ),
              InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  Get.back();
                },
                child: Text(
                  "Already have an account?",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.buttonColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
