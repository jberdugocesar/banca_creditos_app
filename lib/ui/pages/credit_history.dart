import 'package:banca_creditos_app/ui/controllers/credit_controller.dart';
import 'package:banca_creditos_app/ui/pages/credit_simulation.dart';
import 'package:banca_creditos_app/ui/widgets/table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CreditHistoryPage extends StatefulWidget {
  const CreditHistoryPage({Key? key}) : super(key: key);

  @override
  State<CreditHistoryPage> createState() => _CreditHistoryPageState();
}

class _CreditHistoryPageState extends State<CreditHistoryPage> {
  final CreditController creditController = Get.find();

  @override
  void initState() {
    super.initState();
    creditController.start();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height * 0.95;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: LayoutBuilder(
              builder: (context, constraints) => SizedBox(
                    width: screenWidth,
                    height: screenHeight,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Resultado de tu simulador de credito"),
                          const Text(
                              "Te presentamos en tu tabla de amortización"),
                          const Text("Historial de créditos"),
                          SizedBox(
                            height: screenHeight * 0.6,
                            child: Obx(() => InteractiveDataTable(
                                  columnsText: const [
                                    "Monto del crédito",
                                    "Fecha de generación",
                                    "Número de cuotas",
                                    "Interés",
                                  ],
                                  dataRows: <DataRow>[
                                    ...creditController.creditList.map(
                                      (credit) => DataRow(
                                          onLongPress: () {
                                            logInfo(
                                                "this is element ${creditController.creditList.indexOf(credit)} of creditHistory");
                                            creditController
                                                .createSimulationCredit(
                                                    credit.initialValue,
                                                    credit.cuoteNumber,
                                                    credit.interestRate);
                                            showCreditSimulationOfSelectedRow(
                                                MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                context);
                                          },
                                          cells: <DataCell>[
                                            DataCell(Text(credit.initialValue
                                                .toString())),
                                            DataCell(Text(
                                                credit.dateAdded.toString())),
                                            DataCell(Text(
                                                credit.cuoteNumber.toString())),
                                            DataCell(Text(credit.interestRate
                                                .toString())),
                                          ]),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ))),
    );
  }

  Future<dynamic> showCreditSimulationOfSelectedRow(
      double height, BuildContext context) {
    return showMaterialModalBottomSheet(
        backgroundColor: Colors.white70,
        elevation: 0.1,
        useRootNavigator: false,
        context: context,
        builder: (context) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                  height: height,
                  child: CreditSimulationPage(
                    saveButton: false,
                  )),
            ));
  }
}
