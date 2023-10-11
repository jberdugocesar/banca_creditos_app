import 'package:banca_creditos_app/ui/controllers/credit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreditInfoMenu extends StatelessWidget {
  CreditInfoMenu({Key? key}) : super(key: key);

  final CreditController creditController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Cuota máxima del prestamo"),
              Obx(() => Text(
                  "Valor total a pagar: ${creditController.maximumCreditAvailable}")),
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Cerrar")),
            ],
          ),
        ),
      ),
    );
  }
}
