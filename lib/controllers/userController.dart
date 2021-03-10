import 'package:get/get.dart';
import 'package:todo2ndtest/models/user.dart';

class UserController extends GetxController {
  Rx<UserModel> _userModel = Rx<UserModel>();

  UserModel get userGetter => _userModel.value;

  set userSetter(UserModel value) {
    this._userModel.value = value;
  }

  void clear() {
    _userModel.value = UserModel();
  }
}
