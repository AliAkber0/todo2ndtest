import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  String email;

  UserModel({this.id, this.name, this.email});

  // Use for getting the User by providing the snapshot (DataBase) ::::::::::::::::::::::::
  UserModel.fromDocumentSnapShot(DocumentSnapshot doc) {
    this.id = doc.id;
    this.name = doc['name'];
    this.email = doc['email'];
  }
}
