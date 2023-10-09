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

  CreditHistory({
    required this.initialValue,
    required this.cuoteNumber,
    required this.dateAdded,
    required this.interestRate,
  });

  toJson() {
    return {
      "initialValue": initialValue,
      "cuoteNumber": cuoteNumber,
      'interestRate': interestRate,
      'dateAdded': dateAdded.toIso8601String(),
    };
  }

  CreditHistory.fromJson(DataSnapshot snapshot, Map<dynamic, dynamic> json)
      : initialValue = double.parse(json["initialValue"].toString()) * 1.0,
        cuoteNumber = double.parse(json["cuoteNumber"].toString()) * 1.0,
        dateAdded = DateTime.parse(json["dateAdded"]),
        interestRate = double.parse(json["interestRate"].toString());
}
