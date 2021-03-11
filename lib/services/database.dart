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

  void updateTodo(String uid, String todoId, bool newValue) async {
    try {
      print("Upadting Todos ::::::::::::::::::::::::::::::::::::::::::::");
      print("User ID " "$uid");
      print("Todo ID " "$todoId");
      await _firestore
          .collection("users")
          .doc(uid)
          .collection("todos")
          .doc(todoId)
          .update({'done': newValue});
    } catch (e) {
      print(e.message);
      rethrow;
    }
  }

  Stream<List<TodoModel>> todoStream(String uid) {
    return _firestore
        .collection("users")
        .doc(uid)
        .collection("todos")
        .orderBy("dateCreated", descending: true)
        .snapshots()
        .map((QuerySnapshot query) {
      List<TodoModel> retVal = [];
      query.docs.forEach((element) {
        retVal.add(TodoModel.fromDocumentSnapShot(element));
      });
      return retVal;
    });
  }

  // Stream<List<Widget>> todoStream(String uid) {
  //   StreamBuilder<QuerySnapshot>(
  //     stream: _firestore
  //         .collection("users")
  //         .doc(uid)
  //         .collection("todos")
  //         .snapshots(),
  //     builder: (context, snapshot) {
  //       List<Widget> messegesTextWidget = [];
  //       if (snapshot.hasData) {
  //         final todos = snapshot.data.docs;
  //         for (var todo in todos) {
  //           final todoContent = todo.data()['content'];

  //           // final messegeData = Text(
  //           //     "$messegeText from $messegeSender ${messege.data()['alias'] == null ? '' : messege.data()['alias']}");
  //           messegesTextWidget.add(todoContent);
  //         }
  //         return Expanded(
  //           child: ListView(
  //             children: messegesTextWidget,
  //           ),
  //         );
  //       } else {
  //         return Center(
  //           child: CircularProgressIndicator(
  //             backgroundColor: Colors.black,
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }
}
