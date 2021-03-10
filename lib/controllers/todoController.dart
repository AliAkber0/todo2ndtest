import 'package:get/get.dart';
import 'package:todo2ndtest/controllers/authController.dart';
import 'package:todo2ndtest/models/todo.dart';
import 'package:todo2ndtest/services/database.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> _todoList = Rx<List<TodoModel>>();

  List<TodoModel> get getTodos => _todoList.value;

  @override
  void onInit() {
    super.onInit();
    String uid = Get.find<AuthController>().userGetter.uid;
    _todoList.bindStream(DataBase().todoStream(uid));
  }
}
