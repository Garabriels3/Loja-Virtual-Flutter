import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/helpers/firebase_errors.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/result_firebase.dart';
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

  Future<void> getUserDocument({String uid, Function onFail, Function onSuccess}) async {
    try {
      DocumentSnapshot user = await _databaseReference.collection("users").document(uid).get();
      if (user != null) {
        onSuccess(user);
        return;
      }
      onFail();
    } on PlatformException catch (e) {
      return onFail(errorMessage: getErrorString(e.code));
    }
  }
 
}
