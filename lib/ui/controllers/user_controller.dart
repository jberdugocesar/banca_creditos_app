// Controlador usado para manejar los usuarios del chat
import 'dart:async';

import 'package:banca_creditos_app/domain/models/user.dart';
import 'package:banca_creditos_app/ui/controllers/auth_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class UserController extends GetxController {
  // lista en la que se almacenan los uaurios, la misma es observada por la UI
  final Rx<AppUser> _currentUser =
      AppUser(personalId: "idk", email: "neutral", fullName: "fullNombre").obs;

  final _userDatabaseRef = FirebaseDatabase.instance.ref().child('userList');

  Rx<AppUser> get currentUser => _currentUser;

  // método para crear un nuevo usuario
  Future<void> createUser({email, uid, personalId, fullName}) async {
    logInfo("Creating user in realTime for $email and $uid");
    try {
      await _userDatabaseRef
          .child(AuthenticationController().getUid())
          .push()
          .set(AppUser(
                  email: email,
                  fullName: fullName,
                  personalId: personalId,
                  uid: uid)
              .toJson());
    } catch (error) {
      logError(error);
      return Future.error(error);
    }
  }
}
