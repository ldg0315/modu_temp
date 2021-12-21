import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modu_temp/login/model/user_model.dart';

class LoginFirestoreCrud{

  Future<void> addUserData(UserModel user) {
    return FirebaseFirestore.instance.collection('users').add(user.toMap());
  }

}