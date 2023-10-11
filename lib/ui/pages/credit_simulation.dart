import 'package:banca_creditos_app/ui/controllers/credit_controller.dart';
import 'package:banca_creditos_app/ui/pages/credit_save_confirmation_menu.dart';
import 'package:banca_creditos_app/ui/widgets/table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CreditSimulationPage extends StatelessWidget {
  CreditSimulationPage({Key? key, required this.saveButton}) : super(key: key);
  final bool saveButton;

  final CreditController creditController = Get.find();

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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text("Resultado de tu simulador de credito"),
                          const Text(
                              "Te presentamos en tu tabla de amortización"),
                          const Text("Tabla de créditos"),
                          SizedBox(
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
                                  ...creditController.currentCreditSimulation
                                      .map(
                                    (element) => DataRow(cells: <DataCell>[
                                      DataCell(
                                          Text(element.cuoteNumber.toString())),
                                      DataCell(Text(
                                          element.initialValue.toString())),
                                      DataCell(
                                          Text(element.cuoteValue.toString())),
                                      DataCell(Text(
                                          element.interestPayment.toString())),
                                      DataCell(Text(
                                          element.capitalPayment.toString())),
                                      DataCell(
                                          Text(element.balance.toString())),
                                    ]),
                                  )
                                ],
                              )),
                          ElevatedButton(
                            onPressed: () {
                              List<List<dynamic>> data = [
                                [
                                  'Número de la cuota',
                                  'Saldo Inicial',
                                  'Cuota',
                                  'Interes',
                                  'Abono a capital',
                                  'Saldo del período'
                                ],
                                ...creditController.currentCreditSimulation
                                    .map((e) => [
                                          e.cuoteNumber,
                                          e.initialValue,
                                          e.cuoteValue,
                                          e.interestPayment,
                                          e.capitalPayment,
                                          e.balance
                                        ])
                              ];
                              logInfo("Descargar tabla");
                              creditController.generateAndSaveExcel(
                                  data, context);
                            },
                            child: const Text("Descargar Tabla"),
                          ),
                          saveButton != false
                              ? ElevatedButton(
                                  onPressed: () =>
                                      showCreditConfirmationMenuSheet(
                                          screenHeight, context),
                                  child: const Text("Guardar Cotización"),
                                )
                              : const SizedBox.shrink(),
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
}
