import 'package:banca_creditos_app/ui/controllers/credit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveCreditConfirmationMenu extends StatelessWidget {
  const SaveCreditConfirmationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CreditController creditController = Get.find();

    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text("Estas seguro que deseas guardar esta simulación?"),
                const Text(
                    "La cotización realizada la puedes consultar en tu historial de credito"),
                ElevatedButton(
                    onPressed: () {
                      creditController.addCurrentSimulationToCreditHistory();

                      var snackBar = const SnackBar(
                          content: Text('Simulación de credito guardada'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: const Text("Guardar")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancelar")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
