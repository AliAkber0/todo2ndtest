import 'package:flutter/material.dart';
import 'package:todo2ndtest/models/todo.dart';
import 'package:todo2ndtest/services/database.dart';

class TodoCard extends StatelessWidget {
  final String uid;
  final TodoModel todo;

  const TodoCard({Key key, this.uid, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                todo.content,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Checkbox(
              value: todo.done,
              onChanged: (newValue) {
                DataBase().updateTodo(
                  uid,
                  todo.id,
                  newValue,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
