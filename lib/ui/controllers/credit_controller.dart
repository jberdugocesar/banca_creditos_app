// Controlador usado para manejar los usuarios del chat
import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:banca_creditos_app/domain/models/credit.dart';
import 'package:banca_creditos_app/domain/models/user.dart';
import 'package:banca_creditos_app/ui/controllers/auth_controller.dart';
import 'package:excel/excel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:path_provider/path_provider.dart';

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

  Future<void> generateAndSaveExcel(List<List<dynamic>> data, context) async {
    final excel = Excel.createExcel();
    final sheet = excel['Sheet1'];

    for (var row in data) {
      sheet.appendRow(row);
    }

    final directory = Directory('/storage/emulated/0/Download');
    final filePath = '${directory.path}/data.xlsx';

    final file = File(filePath);
    final fileBytes = excel.encode();

    await file.writeAsBytes(fileBytes!);

    // Abre un diálogo de confirmación después de guardar el archivo
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Archivo Excel generado'),
          content: Text('El archivo Excel se ha guardado en $filePath.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // lista en la que se almacenan los uaurios, la misma es observada por la UI
  final RxList<CreditHistory> _creditList = <CreditHistory>[].obs;

  final _creditDatabaseRef = FirebaseDatabase.instance.ref();

  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;

  RxList<CreditHistory> get creditList => _creditList;

  // método para comenzar a escuchar cambios en la "tabla" userList de la base de
  // datos
  void start() {
    _creditList.clear();

    newEntryStreamSubscription = _creditDatabaseRef
        .child("userList")
        .child(AuthenticationController().getUid())
        .child("creditHistoryList")
        .onChildAdded
        .listen(_onEntryAdded);
  }

  // método para dejar de escuchar cambios
  void stop() {
    newEntryStreamSubscription.cancel();
    /* updateEntryStreamSubscription.cancel(); */
  }

  // cuando obtenemos un evento con un nuevo credito lo agregamos a _credits
  _onEntryAdded(DatabaseEvent event) {
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    logInfo("this is called $json");
    _creditList.add(CreditHistory.fromJson(event.snapshot, json));
    logInfo("this is creditList ${_creditList.value}");
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
      await _creditDatabaseRef
          .child("userList")
          .child(AuthenticationController().getUid())
          .child("creditHistoryList")
          .push()
          .set(CreditHistory(
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
