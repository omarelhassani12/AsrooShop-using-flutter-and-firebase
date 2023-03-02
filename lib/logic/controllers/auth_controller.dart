import 'package:asrooshop/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;
  var displayUserName = '';
  var displayUserPhoto = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  var isSignedIn = false;

  final GetStorage authBox = GetStorage();

  void visiblity() {
    isVisibility =
        !isVisibility; //for we change between them(the visible and invisible mode)
    update(); //listen to this methode
  }

  void checkBox() {
    isCheckBox =
        !isCheckBox; //for we change between them(the visible and invisible mode)
    update(); //listen to this methode
  }

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await auth.currentUser!.updateDisplayName(name);
      displayUserName = name;
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'weak-password') {
        message = "Provided Password  is too weak..";
      } else if (error.code == 'email-already-in-use') {
        message = 'Account already exists for that email..';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void loginInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => displayUserName = auth.currentUser!.displayName!,
          );
      isSignedIn = true;
      authBox.write("auth", isSignedIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            'Account does not exists for that $email.. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = "Invalid Password.. Please try again!";
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void googleSignUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displayUserName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;
      isSignedIn = true;
      authBox.write("auth", isSignedIn);

      update();

      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            'Account does not exists for that $email.. Create your account by signing up..';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();

      displayUserName = '';
      displayUserPhoto = '';
      isSignedIn = false;
      authBox.remove("auth");
      update();

      Get.offNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}

//GetxBuilder we use this when we have alight work just small as the above

//Obx it's agianst of the GetxBuilder
