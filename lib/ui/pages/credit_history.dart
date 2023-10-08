import 'package:banca_creditos_app/ui/widgets/form.dart';
import 'package:banca_creditos_app/ui/widgets/table.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditHistoryPage extends StatelessWidget {
  const CreditHistoryPage({Key? key}) : super(key: key);

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
                      color: Colors.pink,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              color: Colors.pink,
                              child: const Text(
                                  "Resultado de tu simulador de credito")),
                          const Text(
                              "Te presentamos en tu tabla de amortización"),
                          const Text("Tabla de créditos"),
                          Container(
                            color: Colors.amber,
                            child: SizedBox(
                                height: screenHeight * 0.44,
                                child: const InteractiveDataTable(
                                  columnsText: [
                                    "Monto del crédito",
                                    "Fecha de generación",
                                    "Número de cuotas",
                                    "Interés",
                                  ],
                                  dataRows: <DataRow>[
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                    DataRow(cells: <DataCell>[
                                      DataCell(Text('Row 1, Col 1')),
                                      DataCell(Text('Row 1, Col 2')),
                                      DataCell(Text('Row 1, Col 3')),
                                      DataCell(Text('Row 1, Col 4')),
                                    ]),
                                  ],
                                )),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Descargar Tabla"),
                          ),
                        ],
                      ),
                    ),
                  ))),
    );
  }
}
