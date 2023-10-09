import 'package:firebase_database/firebase_database.dart';

class AppUser {
  String? uid;
  String email;
  String personalId;
  String fullName;

  AppUser(
      {this.uid,
      required this.personalId,
      required this.email,
      required this.fullName});

  AppUser.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : email = json["email"],
        personalId = json["personalId"],
        uid = snapshot.key,
        fullName = json["fullName"];

  toJson() {
    return {
      "email": email,
      "personalId": personalId,
      "fullName": fullName,
      "uid": uid
    };
  }
}
