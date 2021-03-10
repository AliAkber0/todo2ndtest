import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo2ndtest/models/todo.dart';
import 'package:todo2ndtest/models/user.dart';

class DataBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createUser(UserModel userModel) async {
    try {
      await _firestore
          .collection("users")
          .doc(userModel.id)
          .set({"name": userModel.name, "email": userModel.email});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _docSnapShot =
          await _firestore.collection("users").doc(uid).get();
      print("${_docSnapShot.id}" "::::::::::::::::::::::::::::");
      return UserModel.fromDocumentSnapShot(_docSnapShot);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addTodos(String content, String uid) async {
    try {
      await _firestore.collection("users").doc(uid).collection("todos").add({
        "content": content,
        "dateCreated": Timestamp.now(),
        "done": false,
      });
    } catch (e) {}
  }

  Stream<List<TodoModel>> todoStream(String uid){
    
  }

}
