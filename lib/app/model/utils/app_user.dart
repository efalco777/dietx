import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietx/app/model/user/entity/user_keys.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AppUser {
  static String? get id => FirebaseAuth.instance.currentUser!.uid;
  static DocumentReference<dynamic> get document {
    return FirebaseFirestore.instance.collection(UserKeys.collection).doc(AppUser.id);
  }
}
