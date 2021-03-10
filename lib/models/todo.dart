import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  String id;
  String content;
  Timestamp dateCreated;
  bool done;

  TodoModel({this.id, this.content, this.dateCreated, this.done});

  TodoModel.fromDocumentSnapShot(DocumentSnapshot doc) {
    this.id = doc.id;
    this.content = doc.data()['content'];
    this.dateCreated = doc.data()['dateCreated'];
    this.done = doc.data()['done'];
  }
} 
