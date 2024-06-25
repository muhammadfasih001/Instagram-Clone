import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/Screen/login/login_screen.dart';

class SignOutController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  void signOut() async {
    try {
      await auth.signOut();
      Get.snackbar("Sign Out", "Successfully");
      Get.offAll(() => LoginScreen());
    } catch (e) {
      Get.snackbar("Error signing out", "$e");
    }
  }
}
