import 'package:banca_creditos_app/ui/widgets/form.dart';
import 'package:banca_creditos_app/ui/widgets/table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditHistoryPage extends StatelessWidget {
  const CreditHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height * 0.95;
    return Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
                  child: SizedBox(
                    width: screenWidth,
                    height: screenHeight,
                    child: Container(
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
                                child: const InteractiveDataTable()),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Descargar Tabla"),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
