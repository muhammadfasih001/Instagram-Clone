import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/Screen/signup/create_account.dart';
import 'package:instagram_clone/constant/color.dart';
import 'package:instagram_clone/constant/widget/auth_button.dart';
import 'package:instagram_clone/constant/widget/button.dart';
import 'package:instagram_clone/controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final logInController = Get.put(LoginController());
  final logInKeyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.sacfColor,
        body: SingleChildScrollView(
          child: Obx(() => Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Image.asset(
                        "assets/images/instalogo.png",
                        width: 90,
                      ),
                    ),
                  ),
                  Form(
                    key: logInKeyForm,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: logInController.emailController,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 30.0, horizontal: 15.0),
                              labelText: "Email",
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600,
                                fontSize: 20,
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
                                return 'Enter your email';
                              }
                              final emailRegex = RegExp(
                                  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Enter a valid email address';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: logInController.passwordController,
                            cursorColor: Colors.black,
                            obscureText:
                                logInController.isPasswordVisible.value,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusColor: Colors.white,
                              suffixIcon: InkWell(
                                splashColor: Colors.transparent,
                                onTap: () {
                                  logInController.passwordVisibility();
                                },
                                child: Icon(
                                  logInController.isPasswordVisible.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColor.buttonColor,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 30.0, horizontal: 15.0),
                              labelText:
                                  "Password", // Use labelText instead of label
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade600,
                                fontSize: 20,
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
                    circularLoader: logInController.isLoading.value,
                    txtColor: Colors.white,
                    bgcolo: AppColor.buttonColor,
                    title: "Login",
                    onTap: () {
                      if (logInKeyForm.currentState!.validate()) {
                        logInController.logInWithEmailAndPassword(context);
                      }
                    },
                    height: 60,
                    width: 350,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    onTap: () {
                      //
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 320,
                  ),
                  Button(
                    bgcolo: Colors.transparent,
                    txtColor: AppColor.buttonColor,
                    brdColor: AppColor.buttonColor,
                    brdwidth: 1,
                    title: "Create new account",
                    onTap: () {
                      Get.to(() => SignupScreen());
                    },
                    height: 60,
                    width: 350,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
