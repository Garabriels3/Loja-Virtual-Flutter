import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({this.id, this.name, this.email, this.password, this.passwordConfirmation});

  User.fromDocument({DocumentSnapshot document}) {
    id = document.documentID;
    name = document.data["name"] as String;
    email = document.data["email"] as String;
  }

  String id;
  String name;
  String email;
  String password;
  String passwordConfirmation;

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email
    };
  } 
}
