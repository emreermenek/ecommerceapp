import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app_en/root_page.dart';
import 'package:ecommerce_app_en/services/app_functions.dart';
import 'package:ecommerce_app_en/services/images_manager.dart';
import 'package:ecommerce_app_en/widgets/subtitle_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  Future<void> _googleSignIn({required BuildContext context}) async {
    try {
      final googleSignIn = GoogleSignIn();
      final googleAccount = await googleSignIn.signIn();
      if (googleAccount != null) {
        final googleAuth = await googleAccount.authentication;
        if (googleAuth.accessToken != null && googleAuth.idToken != null) {
          final authResults = await FirebaseAuth.instance.signInWithCredential(
              GoogleAuthProvider.credential(
                  accessToken: googleAuth.accessToken,
                  idToken: googleAuth.idToken));
          if (authResults.additionalUserInfo!.isNewUser) {
            await FirebaseFirestore.instance
                .collection("Users")
                .doc(authResults.user!.uid)
                .set({
              "userId": authResults.user!.uid,
              "userImage": authResults.user!.photoURL,
              "timestamp": Timestamp.now(),
              "userName": authResults.user!.displayName,
              "userEmail": authResults.user!.email,
              "userWish": [],
              "userCard": []
            });
          }
        }
      }
      // FirebaseAuth.instance.currentUser!.reload();
      if (FirebaseAuth.instance.currentUser != null) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Navigator.pushReplacementNamed(context, RootPage.rootName);
        });
      }

      if (!context.mounted) return;
    } on FirebaseException catch (error) {
      await AppFunctions.showErrorOrWarningDialog(
          context: context, func: () {}, title: error.message.toString());
    } catch (error) {
      await AppFunctions.showErrorOrWarningDialog(
          context: context, func: () {}, title: error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () async {
          await _googleSignIn(context: context);
        },
        icon: Image.asset(
          ImagesManager.googleLogo,
          width: 30,
          height: 30,
        ),
        label: const FittedBox(
          child: SubtitleTextWidget(
            label: "Sign in with Google",
            maxLines: 1,
          ),
        ));
  }
}
