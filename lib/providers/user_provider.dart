import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_en/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? _userModel;
  UserModel? get getUserModel {
    return _userModel;
  }

  Future<UserModel?> fetchUserModel() async {
    final auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user == null) {
      return null;
    }
    String uid = user.uid;
    try {
      final userDoc =
          await FirebaseFirestore.instance.collection("Users").doc(uid).get();

      final userDocDict = userDoc.data() as Map<String, dynamic>;
      _userModel = UserModel(
          userId: userDoc.get("userId"),
          userName: userDoc.get("userName"),
          userImage: userDoc.get("userImage"),
          userEmail: userDoc.get("userEmail"),
          createdAt: userDoc.get("timestamp"),
          userCard: userDocDict.containsKey("userCard")
              ? userDoc.get("userCard")
              : [],
          userWish: userDocDict.containsKey("userWish")
              ? userDoc.get("userWish")
              : []);
      return _userModel;
    } on FirebaseException catch (error) {
      rethrow;
    } catch (error) {
      rethrow;
    }
  }
}
