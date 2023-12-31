import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loggy/loggy.dart';

class AuthenticationController extends GetxController {
  Future<bool> login(theEmail, thePassword) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: theEmail, password: thePassword);
      logInfo('OK');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        logInfo('NOK 1');
        return Future.error("User not found");
      } else if (e.code == 'wrong-password') {
        logInfo('NOK 2');
        return Future.error("Wrong password");
      }
      return false;
    }
  }

  Future<bool> signUp({email, password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('The account already exists for that email.');
      }
      return false;
    }
  }

  Future<void> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  String userEmail() {
    String email = FirebaseAuth.instance.currentUser!.email ?? "a@a.com";
    return email;
  }

  String getUid() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return uid;
  }
}
