import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/App/domain/models/result_firebase.dart';
import 'package:loja_virtual/App/domain/models/user.dart';
import 'package:loja_virtual/shared/helpers/firebase_errors.dart';
import 'firebase_store_I.dart';

class FirebaseStoreImpl implements FirebaseStoreI {
  Firestore _databaseReference = Firestore.instance;

  @override
  Future<VoidResult> createUser(String userUID, User user) async {
    try {
      await _databaseReference
          .collection("users")
          .document(userUID)
          .setData(user.toMap());
      return VoidResult();
    } on PlatformException catch (e) {
      return VoidResult(errorMessage: getErrorString(e.code));
    }
  }

  Future<Result> getUserDocument({String uid}) async {
    try {
      DocumentSnapshot user = await _databaseReference.collection("users").document(uid).get();
      if (user != null) {
        return Result(item: user);
      }
      return Result(errorMessage: "Not User");
    } on PlatformException catch (e) {
      return Result(errorMessage: getErrorString(e.code));
    }
  }
}
