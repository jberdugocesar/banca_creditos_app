// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';

class CreditRow {
  double initialValue;
  double cuoteNumber;
  double cuoteValue;
  double interestPayment;
  double capitalPayment;
  double balance;

  CreditRow({
    required this.initialValue,
    required this.cuoteNumber,
    required this.cuoteValue,
    required this.interestPayment,
    required this.capitalPayment,
    required this.balance,
  });

  toJson() {
    return {
      "initialValue": initialValue,
      "cuoteNumber": cuoteNumber,
      "cuoteValue": cuoteValue,
      'interestPayment': interestPayment,
      'capitalPayment': capitalPayment,
      "balance": balance
    };
  }

  CreditRow.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : initialValue = json["initialValue"],
        cuoteNumber = json["cuoteNumber"],
        cuoteValue = json["cuoteValue"],
        interestPayment = json["interestPayment"],
        capitalPayment = json["capitalPayment"],
        balance = json["balance"];
}

class CreditHistory {
  double initialValue;
  double cuoteNumber;
  DateTime dateAdded;
  double interestRate;
  List<CreditRow> creditRows;

  CreditHistory({
    required this.initialValue,
    required this.cuoteNumber,
    required this.dateAdded,
    required this.interestRate,
    required this.creditRows,
  });

  toJson() {
    return {
      "initialValue": initialValue,
      "cuoteNumber": cuoteNumber,
      'interestRate': interestRate,
      'dateAdded': dateAdded.toIso8601String(),
      "creditRows": [
        ...creditRows.map((e) => CreditRow(
              initialValue: e.initialValue,
              cuoteNumber: e.cuoteNumber,
              cuoteValue: e.cuoteValue,
              interestPayment: e.interestPayment,
              capitalPayment: e.capitalPayment,
              balance: e.balance,
            ).toJson())
      ]
    };
  }

  CreditHistory.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : initialValue = json["initialValue"],
        cuoteNumber = json["cuoteNumber"],
        dateAdded = DateTime.parse(json["dateAdded"]),
        interestRate = json["interestRate"],
        creditRows = json["creditRows"];
}
