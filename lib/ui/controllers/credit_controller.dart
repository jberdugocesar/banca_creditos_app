// Controlador usado para manejar los usuarios del chat
import 'dart:async';
import 'dart:math';
import 'package:banca_creditos_app/domain/models/credit.dart';
import 'package:banca_creditos_app/domain/models/user.dart';
import 'package:banca_creditos_app/ui/controllers/auth_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class CreditController extends GetxController {
  final _creditHistoryList = <CreditHistory>[].obs;
  final _creditSimulationList = <CreditRow>[].obs;

  final _maximumCreditAvailable = 0.obs;

  get creditHistoryList => _creditHistoryList;

  get creditSimulationList => _creditSimulationList;

  get maximumCreditAvailable => _maximumCreditAvailable;

  final databaseRef = FirebaseDatabase.instance
      .ref()
      .child("userList")
      .child(AuthenticationController().getUid())
      .child("creditHistoryList");

  void createSimulationCredit(
      double creditInitialValue, double cuoteNumber, double interestRate) {
    logInfo("hello there");
    double capitalPayment;
    double interestPayment;
    double cuoteValue;
    double balanceOfPeriod = creditInitialValue.toDouble();
    double i = 0;
    List<CreditRow> rows = [];

    double fixedCuoteValue = creditInitialValue *
            interestRate /
            (1 - pow((1 + interestRate), cuoteNumber)) -
        interestRate * creditInitialValue;

    while (i < cuoteNumber) {
      interestPayment = interestRate * balanceOfPeriod;

      capitalPayment = fixedCuoteValue + interestPayment;

      cuoteValue = capitalPayment - interestPayment;

      balanceOfPeriod = (balanceOfPeriod + cuoteValue + interestPayment);

      rows.add(CreditRow(
          initialValue: creditInitialValue,
          cuoteNumber: cuoteNumber,
          cuoteValue: capitalPayment,
          interestPayment: interestPayment,
          capitalPayment: capitalPayment,
          balance: balanceOfPeriod));

      logInfo(
          "Iteration $i \n with balancedPeriod: $balanceOfPeriod \n interestPayment: $interestPayment \n capitalPayment: $capitalPayment \n and cuoteValue: $cuoteValue");
      i++;
    }
    //Save State
    _creditSimulationList.value = rows;
  }

  void calculateMaximumCreditAvailable(double salary) {
    _maximumCreditAvailable.value = salary * 7 ~/ 0.15;
    logInfo("This is here and changed value ");
  }

  void saveToCreditHistory(List<String> currentTable) {}

  void currentCreditTableToExcel() {}

  /* // lista en la que se almacenan los uaurios, la misma es observada por la UI
  final _creditHistoriyList = <CreditHistory>[].obs;

  final databaseRef =
      FirebaseDatabase.instance.ref().child("userList").child("creditList");

  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;

  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;

  get creditHistoryList => _creditHistoriyList;

  // método para comenzar a escuchar cambios en la "tabla" userList de la base de
  // datos
  void start() {
    _creditHistoriyList.clear();

    newEntryStreamSubscription =
        databaseRef.child("creditList").onChildAdded.listen(_onEntryAdded);

    /* updateEntryStreamSubscription =
        databaseRef.child("userList").onChildChanged.listen(_onEntryChanged); */
  }

  // método para dejar de escuchar cambios
  void stop() {
    newEntryStreamSubscription.cancel();
    /* updateEntryStreamSubscription.cancel(); */
  }

  // cuando obtenemos un evento con un nuevo credito lo agregamos a _credits
  _onEntryAdded(DatabaseEvent event) {
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    _creditHistoriyList.add(CreditHistory.fromJson(event.snapshot, json));
  }

  // método para crear un nuevo credito
  Future<void> addNewCredit(
      {initialValue, cuoteNumber, dateAdded, interestRate, creditRows}) async {
    logInfo(
        "Creating creditHistory in realTime for user: ${AuthenticationController().getUid()}");
    try {
      await databaseRef.push().set(CreditHistory(
              initialValue: initialValue,
              cuoteNumber: cuoteNumber,
              dateAdded: dateAdded,
              interestRate: interestRate,
              creditRows: creditRows)
          .toJson());
    } catch (error) {
      logError(error);
      return Future.error(error);
    }
  } */
}
