// Controlador usado para manejar los usuarios del chat
import 'dart:async';
import 'dart:ffi';
import 'dart:math';
import 'package:banca_creditos_app/domain/models/credit.dart';
import 'package:banca_creditos_app/domain/models/user.dart';
import 'package:banca_creditos_app/ui/controllers/auth_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class CreditController extends GetxController {
  final RxList<CreditRow> _currentCreditSimulation = <CreditRow>[].obs;

  final RxDouble _currentInitialCredit = 0.0.obs;
  final RxDouble _currentInterestRate = 0.0.obs;
  final RxDouble _currentCuoteNumber = 0.0.obs;

  final _maximumCreditAvailable = 0.obs;

  RxDouble get currentInitialCredit => _currentInitialCredit;

  RxDouble get currentInterestRate => _currentInterestRate;

  RxDouble get currentCuoteNumber => _currentCuoteNumber;

  RxList<CreditRow> get currentCreditSimulation => _currentCreditSimulation;

  get maximumCreditAvailable => _maximumCreditAvailable;

  final databaseRef = FirebaseDatabase.instance
      .ref()
      .child("userList")
      .child(AuthenticationController().getUid())
      .child("creditHistoryList");

  void updateCurrentSimulationCreditValues(
      double creditInitialValue, double cuoteNumber, double interestRate) {
    _currentInitialCredit.value = creditInitialValue;
    _currentInterestRate.value = interestRate;
    _currentCuoteNumber.value = cuoteNumber;
  }

  void createSimulationCredit(
      double creditInitialValue, double cuoteNumber, double interestRate) {
    updateCurrentSimulationCreditValues(
        creditInitialValue, cuoteNumber, interestRate);

    double capitalPayment;
    double interestPayment;
    double cuoteValue;
    List<CreditRow> rows = [];
    double creditBefore = creditInitialValue;
    double balanceOfPeriod = creditInitialValue.toDouble();
    double cont = 1;

    double fixedCuoteValue = creditInitialValue *
            interestRate /
            (1 - pow((1 + interestRate), cuoteNumber)) -
        interestRate * creditInitialValue;

    while (cont < cuoteNumber + 1) {
      interestPayment = interestRate * balanceOfPeriod;

      capitalPayment = fixedCuoteValue + interestPayment;

      cuoteValue = capitalPayment - interestPayment;

      balanceOfPeriod = (balanceOfPeriod + cuoteValue + interestPayment);

      rows.add(CreditRow(
          initialValue: creditBefore,
          cuoteNumber: cont,
          cuoteValue: cuoteValue,
          interestPayment: interestPayment,
          capitalPayment: capitalPayment,
          balance: balanceOfPeriod));

      creditBefore = balanceOfPeriod;

      logInfo(
          "Iteration $cont \n with balancedPeriod: $balanceOfPeriod \n interestPayment: $interestPayment \n capitalPayment: $capitalPayment \n and cuoteValue: $cuoteValue");
      cont++;
    }
    _currentCreditSimulation.value = rows;
  }

  void clearSimulationList() {
    _currentCreditSimulation.value = [];
  }

  void calculateMaximumCreditAvailable(double salary) {
    _maximumCreditAvailable.value = salary * 7 ~/ 0.15;
    logInfo("This is here and changed value ");
  }

  void addCurrentSimulationToCreditHistory() {
    addNewCredit(
        cuoteNumber: _currentCuoteNumber.value,
        dateAdded: DateTime.now(),
        interestRate: _currentInterestRate.value,
        initialValue: _currentInitialCredit.value);
    logInfo("Tabla con ${_currentCuoteNumber.value} guardada en el historial");
  }

  void currentCreditTableToExcel() {
    logInfo("currentCreditTableToExcel");
  }

  // lista en la que se almacenan los uaurios, la misma es observada por la UI
  final RxList<CreditHistory> _creditList = <CreditHistory>[].obs;

  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;

  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;

  RxList<CreditHistory> get creditList => _creditList;

  // método para comenzar a escuchar cambios en la "tabla" userList de la base de
  // datos
  void start() {
    _creditList.clear();

    newEntryStreamSubscription = databaseRef.onChildAdded.listen(_onEntryAdded);

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
    logInfo("this is $json");
    _creditList.add(CreditHistory.fromJson(event.snapshot, json));
  }

  // método para crear un nuevo credito
  Future<void> addNewCredit(
      {required double initialValue,
      required double cuoteNumber,
      required DateTime dateAdded,
      required double interestRate}) async {
    logInfo(
        "Creating creditHistory in realTime for user: ${AuthenticationController().getUid()}");
    try {
      await databaseRef.push().set(CreditHistory(
            initialValue: initialValue,
            cuoteNumber: cuoteNumber,
            dateAdded: dateAdded,
            interestRate: interestRate,
          ).toJson());
    } catch (error) {
      logError(error);
      return Future.error(error);
    }
  }
}
