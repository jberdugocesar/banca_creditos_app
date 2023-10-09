// Controlador usado para manejar los usuarios del chat
import 'dart:async';

import 'package:banca_creditos_app/domain/models/user.dart';
import 'package:banca_creditos_app/ui/controllers/auth_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class UserController extends GetxController {
  // lista en la que se almacenan los uaurios, la misma es observada por la UI
  final _userList = <AppUser>[].obs;

  final databaseRef = FirebaseDatabase.instance.ref();

  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;

  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;

  get userList => _userList;

  // método para comenzar a escuchar cambios en la "tabla" userList de la base de
  // datos
  void start() {
    _userList.clear();

    newEntryStreamSubscription =
        databaseRef.child("userList").onChildAdded.listen(_onEntryAdded);

    /* updateEntryStreamSubscription =
        databaseRef.child("userList").onChildChanged.listen(_onEntryChanged); */
  }

  // método para dejar de escuchar cambios
  void stop() {
    newEntryStreamSubscription.cancel();
    /* updateEntryStreamSubscription.cancel(); */
  }

  // cuando obtenemos un evento con un nuevo usuario lo agregamos a _users
  _onEntryAdded(DatabaseEvent event) {
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    _userList.add(AppUser.fromJson(event.snapshot, json));
  }

  /* // cuando obtenemos un evento con un usuario modificado lo reemplazamos en _users
  // usando el key como llave
  _onEntryChanged(DatabaseEvent event) {
    var oldEntry = _users.singleWhere((entry) {
      return entry.uid == event.snapshot.key;
    });

    final json = event.snapshot.value as Map<dynamic, dynamic>;
    _users[_users.indexOf(oldEntry)] = AppUser.fromJson(event.snapshot, json);
  } */

  // método para crear un nuevo usuario
  Future<void> createUser({email, uid, personalId, fullName}) async {
    logInfo("Creating user in realTime for $email and $uid");
    try {
      await databaseRef.child('userList').push().set(AppUser(
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
