import 'package:get/get.dart';

class UserController extends GetxController {
  var userName = ''.obs;
  var email = ''.obs;

  void updateUserData(String newUserName, String newEmail) {
    userName.value = newUserName;
    email.value = newEmail;
  }
}
