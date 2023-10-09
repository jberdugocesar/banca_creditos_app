import 'dart:async';

import 'package:firebase_database/firebase_database.dart';

class UserRemoteRepository {
  final databaseReference = FirebaseDatabase.instance.ref();
  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;
  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;
}
