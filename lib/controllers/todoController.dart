import 'package:get/get.dart';
import 'package:todo2ndtest/models/todo.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel>> _todoList = Rx<List<TodoModel>>();

  List<TodoModel> get getTodos => _todoList.value;
}
