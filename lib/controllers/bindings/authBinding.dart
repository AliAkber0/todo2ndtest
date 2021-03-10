import 'package:get/get.dart';
import 'package:todo2ndtest/controllers/authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // ToDo: implement dependencies
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
