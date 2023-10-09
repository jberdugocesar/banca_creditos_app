import 'package:banca_creditos_app/ui/controllers/credit_controller.dart';
import 'package:banca_creditos_app/ui/pages/credit_info_menu.dart';
import 'package:banca_creditos_app/ui/pages/credit_save_confirmation_menu.dart';
import 'package:banca_creditos_app/ui/widgets/table.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CreditSimulationPage extends StatelessWidget {
  CreditSimulationPage({Key? key}) : super(key: key);

  CreditController creditController = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height * 0.95;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
              builder: (context, constraints) => SizedBox(
                    width: screenWidth,
                    height: screenHeight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                              color: Colors.purple,
                              child: const Text(
                                  "Resultado de tu simulador de credito")),
                          const Text(
                              "Te presentamos en tu tabla de amortización"),
                          const Text("Tabla de créditos"),
                          IconButton(
                              onPressed: () {
                                showCreditResumeMenuSheet(
                                    screenHeight, context);
                              },
                              icon: const Icon(
                                Icons.info,
                                size: 60,
                              )),
                          Container(
                              color: Colors.amber,
                              child: SizedBox(
                                  height: screenHeight * 0.44,
                                  child: InteractiveDataTable(
                                    columnsText: const [
                                      "Número de la cuota",
                                      "Saldo inicial",
                                      "Cuota",
                                      "Interés",
                                      "Abono a capital",
                                      "Saldo del período"
                                    ],
                                    dataRows: <DataRow>[
                                      ...creditController.creditSimulationList
                                          .map(
                                        (element) => DataRow(cells: <DataCell>[
                                          DataCell(Text(
                                              element.cuoteNumber.toString())),
                                          DataCell(Text(
                                              element.initialValue.toString())),
                                          DataCell(Text(
                                              element.cuoteValue.toString())),
                                          DataCell(Text(element.interestPayment
                                              .toString())),
                                          DataCell(Text(element.capitalPayment
                                              .toString())),
                                          DataCell(
                                              Text(element.balance.toString())),
                                        ]),
                                      )
                                    ],
                                  ))),
                          ElevatedButton(
                            onPressed: () {
                              logInfo("Descargar tabla");
                            },
                            child: const Text("Descargar Tabla"),
                          ),
                          ElevatedButton(
                            onPressed: () => showCreditConfirmationMenuSheet(
                                screenHeight, context),
                            child: const Text("Guardar Cotización"),
                          ),
                        ],
                      ),
                    ),
                  )),
        ));
  }

  Future<dynamic> showCreditConfirmationMenuSheet(
      double height, BuildContext context) {
    return showMaterialModalBottomSheet(
        backgroundColor: Colors.white70,
        elevation: 0.1,
        useRootNavigator: false,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        builder: (context) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                  height: height * 0.35,
                  child: const SaveCreditConfirmationMenu()),
            ));
  }

  Future<dynamic> showCreditResumeMenuSheet(
      double height, BuildContext context) {
    return showMaterialModalBottomSheet(
        backgroundColor: Colors.white70,
        elevation: 0.1,
        useRootNavigator: false,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        builder: (context) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(height: height * 0.35, child: CreditInfoMenu()),
            ));
  }
}
